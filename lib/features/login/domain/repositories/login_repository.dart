import 'package:example/features/login/domain/entities/login_entity.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/features/login/domain/entities/login_request_entity.dart';

abstract class LoginRepository {
  ResultFuture<LoginEntity> loginUser({required LoginRequestEntity request});
}
