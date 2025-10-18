import 'package:dio/dio.dart';
import 'package:example/common/resources/network_resources/rest_client/rest_client.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/resources/network_resources/api_endpoints.dart';
import 'package:example/features/login/data/models/login_model.dart';
import 'package:example/features/login/domain/entities/login_request_entity.dart';
import 'package:example/features/login/data/models/login_request_model.dart';

abstract class LoginRemoteDataSource {
  Future<LoginModel> loginUser(LoginRequestEntity request);
}

/// [LoginRemoteDataSourceImpl] handles network operations in clean architecture
/// Implements the data source interface for remote API calls
/// Best Practice: Separates network logic from business logic
class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final RestClient _restClient;

  LoginRemoteDataSourceImpl(this._restClient);

  @override
  Future<LoginModel> loginUser(LoginRequestEntity request) async {
    try {
      final requestModel = LoginRequestModel.fromEntity(request);
      final response = await _restClient.post(
        APIEndpoints.loginUserEndpoint,
        data: requestModel.toJson(),
      );

      return LoginModel.fromJson(response);
    } on DioException catch (dioError, stackTrace) {
      Log.warning(
        "DioException while logging in user",
        dioError,
        stackTrace,
      );

      final statusCode = dioError.response?.statusCode ?? -1;
      final message = dioError.response?.data is Map
          ? dioError.response?.data["message"]?.toString() ?? dioError.message
          : dioError.message ?? "Unknown error";

      throw APIException(message: message!, statusCode: statusCode);
    } catch (e, stackTrace) {
      Log.warning(
        "Unexpected error while logging in user",
        e,
        stackTrace,
      );

      throw APIException(
        message: e.toString(),
        statusCode: -1,
      );
    }
  }
}
