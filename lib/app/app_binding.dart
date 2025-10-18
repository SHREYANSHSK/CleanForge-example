import 'package:get/get.dart';
import 'package:example/common/resources/network_resources/rest_client/rest_client.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:example/common/resources/network_resources/network_info/network_info.dart';
import 'package:example/common/resources/network_resources/rest_client/clients/dio_client/dio_client.dart';
import 'package:example/common/core/theme/theme_controller.dart';

class AppBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    // Register common dependencies
    Get.lazyPut<NetworkInfo>(
      () => NetworkInfo(connectivity: Connectivity()),
    );

    Get.lazyPut<RestClient>(
      () => DioClient(networkInfo: Get.find()),
    );

    // Register theme controller
    Get.put(ThemeController(), permanent: true);
  }
}
