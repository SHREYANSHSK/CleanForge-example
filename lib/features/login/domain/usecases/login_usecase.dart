import 'package:example/features/login/domain/repositories/login_repository.dart';
import 'package:example/features/login/domain/entities/login_entity.dart';
import 'package:example/common/core/utils/use_cases/user_cases.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/features/login/domain/entities/login_request_entity.dart';

///NOTE: class can be implemented with UseCaseWithoutParams as well if no parameters needs to be pass
///NOTE: If more use-cases needs to be added then make separate usecase file

/// [LoginUserUseCase] implements clean architecture's use case pattern
/// Orchestrates the flow of data between the UI and data layers
/// Best Practice: Single responsibility principle with focused business logic
class LoginUserUseCase
    implements UseCaseWithParams<LoginEntity, LoginUserUseCaseParams> {
  final LoginRepository repository;
  LoginUserUseCase(this.repository);

  @override
  ResultFuture<LoginEntity> call(LoginUserUseCaseParams params) async {
    return await repository.loginUser(request: params.request);
  }
}

class LoginUserUseCaseParams {
  final LoginRequestEntity request;
  LoginUserUseCaseParams({required this.request});
}
