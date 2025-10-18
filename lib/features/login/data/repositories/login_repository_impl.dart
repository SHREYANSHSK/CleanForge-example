import 'package:dartz/dartz.dart';
import 'package:example/features/login/data/datasources/remote/login_remote_datasource.dart';
import 'package:example/features/login/data/datasources/local/login_local_datasource.dart';
import 'package:example/features/login/data/models/login_model.dart';
import 'package:example/features/login/domain/entities/login_entity.dart';
import 'package:example/features/login/domain/repositories/login_repository.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:example/features/login/domain/entities/login_request_entity.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});


  @override
  ResultFuture<LoginEntity> loginUser({required LoginRequestEntity request}) async {
    try {
      final LoginModel model = await remoteDataSource.loginUser(request);

      // Cache user data locally
      await localDataSource.setAccessToken(model.accessToken);
      await localDataSource.setUserId(model.user.id);

      return Right(model.toEntity());
    } on APIException catch (e) {
      Log.error("API Exception during login: ${e.message}");
      return Left(APIException(message: e.message, statusCode: e.statusCode));
    } on StorageException catch (e) {
      Log.error("Storage Exception during login: ${e.message}");
      return Left(StorageException(message: e.message));
    } catch (e, stackTrace) {
      Log.error("Unexpected error in LoginRepositoryImpl during login", e, stackTrace);
      return Left(APIException(message: e.toString(), statusCode: -1));
    }
  }
}
