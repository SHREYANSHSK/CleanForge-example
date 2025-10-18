import 'package:example/features/register/domain/repositories/register_repository.dart';
import 'package:example/features/register/domain/entities/register_entity.dart';
import 'package:example/features/register/domain/entities/register_request_entity.dart';
import 'package:example/common/core/utils/use_cases/user_cases.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';

///NOTE: class can be implemented with UseCaseWithoutParams as well if no parameters needs to be pass
///NOTE: If more use-cases needs to be added then make separate usecase file

class RegisterUserUseCase
    implements UseCaseWithParams<RegisterEntity, RegisterUserUseCaseParams> {
  final RegisterRepository repository;
  RegisterUserUseCase(this.repository);

  @override
  ResultFuture<RegisterEntity> call(RegisterUserUseCaseParams params) async {
    return await repository.registerUser(request: params.request);
  }
}

class RegisterUserUseCaseParams {
  final RegisterRequestEntity request;
  RegisterUserUseCaseParams({required this.request});
}
