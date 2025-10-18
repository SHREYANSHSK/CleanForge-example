import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/features/home/domain/entities/home_entity.dart';
import 'package:example/features/home/domain/entities/logout_entity.dart';

/// [HomeRepository] defines the contract for data operations in clean architecture
/// Abstracts the data layer from domain layer through interfaces
/// Best Practice: Dependency inversion principle for loose coupling
abstract class HomeRepository {
  ResultFuture<UserDataEntity> getUserData();
  ResultFuture<LogOutUserEntity> logoutUser();
}
