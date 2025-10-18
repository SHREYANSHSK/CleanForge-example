import 'package:example/common/resources/network_resources/rest_client/rest_client.dart';
import 'package:example/features/home/domain/usecases/logout_useCase.dart';
import 'package:get/get.dart';
import 'package:example/features/home/data/datasources/local/home_local_datasource.dart';
import 'package:example/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:example/features/home/data/repositories/home_repository_impl.dart';
import 'package:example/features/home/domain/repositories/home_repository.dart';
import 'package:example/features/home/domain/usecases/userData_usecase.dart';
import 'package:example/features/home/presentation/controllers/home_controller.dart';
import 'package:example/features/home/presentation/states/home_state.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(Get.find<RestClient>()),
    );
    Get.lazyPut<HomeLocalDataSource>(
      () => HomeLocalDataSourceImpl(),
    );
    Get.lazyPut<HomeRepository>(
      () => HomeRepositoryImpl(
        remoteDataSource: Get.find<HomeRemoteDataSource>(),
        localDataSource: Get.find<HomeLocalDataSource>(),
      ),
    );
    Get.lazyPut<GetHomeUseCase>(
      () => GetHomeUseCase(Get.find<HomeRepository>()),
    );
    Get.lazyPut<LogoutUseCase>(
      () => LogoutUseCase(Get.find<HomeRepository>()),
    );
    Get.lazyPut<HomeState>(() => HomeState());
    Get.lazyPut(() => HomeController(
        getHomeUseCase: Get.find<GetHomeUseCase>(),
        state: Get.find<HomeState>(), logoutUseCase: Get.find<LogoutUseCase>()));
  }
}
