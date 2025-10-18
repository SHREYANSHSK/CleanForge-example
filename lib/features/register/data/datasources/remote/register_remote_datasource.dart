import 'package:dio/dio.dart';
import 'package:example/common/resources/network_resources/rest_client/rest_client.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/resources/network_resources/api_endpoints.dart';
import 'package:example/features/register/data/models/register_model.dart';
import 'package:example/features/register/data/models/register_request_model.dart';
import 'package:example/features/register/domain/entities/register_request_entity.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterModel> registerUser(RegisterRequestEntity request);
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final RestClient _restClient;

  RegisterRemoteDataSourceImpl(this._restClient);

  @override
  Future<RegisterModel> registerUser(RegisterRequestEntity request) async {
    try {
      final requestModel = RegisterRequestModel.fromEntity(request);
      final response = await _restClient.post(
        APIEndpoints.registerUserEndpoint,
        data: requestModel.toJson(),
      );

      return RegisterModel.fromJson(response);
    } on DioException catch (dioError, stackTrace) {
      Log.warning(
        "DioException while registering user",
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
        "Unexpected error while registering user",
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
