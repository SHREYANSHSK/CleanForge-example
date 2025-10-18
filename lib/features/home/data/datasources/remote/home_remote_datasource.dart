import 'package:dio/dio.dart';
import 'package:example/common/resources/network_resources/rest_client/rest_client.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/resources/network_resources/api_endpoints.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:example/features/home/data/models/home_model.dart';
import 'package:example/features/home/data/models/logout_model.dart';

abstract class HomeRemoteDataSource {
  Future<UserDataModel> fetchHomeData();
  Future<LogOutUserModel> logoutUser();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final RestClient _restClient;

  HomeRemoteDataSourceImpl(this._restClient);

  @override
  Future<UserDataModel> fetchHomeData() async {
    try {
      final response = await _restClient.get(APIEndpoints.homeDataByIdEndPoint);
      return UserDataModel.fromJson(response);
    } on DioException catch (dioError, stackTrace) {
      Log.warning(
        "DioException while fetching home data",
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
        "Unexpected error while fetching home data",
        e,
        stackTrace,
      );

      throw APIException(
        message: e.toString(),
        statusCode: -1,
      );
    }
  }

  @override
  Future<LogOutUserModel> logoutUser() async {
    try {
      final response = await _restClient.post(APIEndpoints.logoutUserEndpoint);
      return LogOutUserModel.fromJson(response);
    } on DioException catch (dioError, stackTrace) {
      Log.warning(
        "DioException while fetching home data",
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
        "Unexpected error while logging out",
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
