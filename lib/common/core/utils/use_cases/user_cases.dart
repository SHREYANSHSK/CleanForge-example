import 'package:example/common/core/utils/type_def/type_def.dart';

/// [UseCaseWithParams] defines the base contract for parameterized use cases
/// Enforces clean architecture's use case pattern with type safety
/// Best Practice: Standardizes use case implementation across the app
abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();
  ResultFuture<Type> call();
}
