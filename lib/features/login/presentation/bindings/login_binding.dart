import 'package:get/get.dart';
import 'package:example/features/login/data/datasources/local/login_local_datasource.dart';
import 'package:example/features/login/data/datasources/remote/login_remote_datasource.dart';
import 'package:example/features/login/data/repositories/login_repository_impl.dart';
import 'package:example/features/login/domain/repositories/login_repository.dart';
import 'package:example/features/login/domain/usecases/login_usecase.dart';
import 'package:example/features/login/presentation/controllers/login_controller.dart';
import 'package:example/features/login/presentation/states/login_state.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<LoginLocalDataSource>(
      () => LoginLocalDataSourceImpl(),
    );
    Get.lazyPut<LoginRepository>(
      () => LoginRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
      ),
    );

    Get.lazyPut<LoginUserUseCase>(
      () => LoginUserUseCase(Get.find()),
    );
    Get.lazyPut<LoginState>(() => LoginState());
    Get.lazyPut<LoginController>(() => LoginController(
        loginUserUseCase: Get.find<LoginUserUseCase>(),
        state: Get.find<LoginState>()));
  }
}
