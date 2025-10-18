import 'package:get/get.dart';
import 'package:example/features/register/data/datasources/local/register_local_datasource.dart';
import 'package:example/features/register/data/datasources/remote/register_remote_datasource.dart';
import 'package:example/features/register/data/repositories/register_repository_impl.dart';
import 'package:example/features/register/domain/repositories/register_repository.dart';
import 'package:example/features/register/domain/usecases/register_usecase.dart';
import 'package:example/features/register/presentation/controllers/register_controller.dart';
import 'package:example/features/register/presentation/states/register_state.dart';

/// [RegisterBinding] sets up dependency injection in clean architecture
/// Configures and provides dependencies for the registration feature
/// Best Practice: Centralizes dependency management and promotes loose coupling
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterRemoteDataSource>(
      () => RegisterRemoteDataSourceImpl(Get.find()),
    );
    Get.lazyPut<RegisterLocalDataSource>(
      () => RegisterLocalDataSourceImpl(),
    );
    Get.lazyPut<RegisterRepository>(
      () => RegisterRepositoryImpl(
        remoteDataSource: Get.find(),
        localDataSource: Get.find(),
      ),
    );
    Get.lazyPut<RegisterUserUseCase>(
      () => RegisterUserUseCase(Get.find()),
    );
    Get.lazyPut<RegisterState>(() => RegisterState());
    Get.lazyPut<RegisterController>(() => RegisterController(
        registerUserUseCase: Get.find<RegisterUserUseCase>(),
        state: Get.find<RegisterState>()));
  }
}
