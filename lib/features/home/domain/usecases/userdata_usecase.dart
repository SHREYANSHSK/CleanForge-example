import 'package:example/features/home/domain/repositories/home_repository.dart';
import 'package:example/features/home/domain/entities/home_entity.dart';
import 'package:example/common/core/utils/use_cases/user_cases.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';

///NOTE: Class can be implemented with UseCaseWithoutParams as well if no parameters needs to be pass
///NOTE: If more use-cases needs to be added then make separate usecase file
class GetHomeUseCase implements UseCaseWithoutParams<UserDataEntity> {
  final HomeRepository repository;
  GetHomeUseCase(this.repository);
  @override
  ResultFuture<UserDataEntity> call() async {
    return await repository.getUserData();
  }
}
