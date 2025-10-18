import 'package:dio/dio.dart';
import 'package:example/common/resources/storage_resources/local_keys.dart';
import 'package:example/common/resources/storage_resources/local_client.dart';
import 'dio_client.dart';

class DioInterceptor extends Interceptor {
  final DioClient client;

  DioInterceptor(this.client);
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.clear();
    options.headers.addAll({
      "content-type": "application/json",
      "Authorization": await LocalClient.getString(
        key: LocalKeys.accessToken,
      ),
    });
    client.logRequest(options);
    super.onRequest(options, handler);
  }
}
