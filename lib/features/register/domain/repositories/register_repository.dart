import 'package:example/features/register/domain/entities/register_entity.dart';
import 'package:example/features/register/domain/entities/register_request_entity.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';

abstract class RegisterRepository {
  ResultFuture<RegisterEntity> registerUser(
      {required RegisterRequestEntity request});
}
