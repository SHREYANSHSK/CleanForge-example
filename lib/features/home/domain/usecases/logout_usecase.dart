import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/common/core/utils/use_cases/user_cases.dart';
import 'package:example/features/home/domain/entities/logout_entity.dart';
import 'package:example/features/home/domain/repositories/home_repository.dart';

class LogoutUseCase implements UseCaseWithoutParams<LogOutUserEntity> {
  final HomeRepository repository;
  LogoutUseCase(this.repository);
  @override
  ResultFuture<LogOutUserEntity> call() async {
    return await repository.logoutUser();
  }
}