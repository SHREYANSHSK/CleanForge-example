import 'package:dartz/dartz.dart';
import 'package:example/features/register/data/datasources/remote/register_remote_datasource.dart';
import 'package:example/features/register/data/datasources/local/register_local_datasource.dart';
import 'package:example/features/register/data/models/register_model.dart';
import 'package:example/features/register/domain/entities/register_entity.dart';
import 'package:example/features/register/domain/entities/register_request_entity.dart';
import 'package:example/features/register/domain/repositories/register_repository.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;
  final RegisterLocalDataSource localDataSource;

  RegisterRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  ResultFuture<RegisterEntity> registerUser(
      {required RegisterRequestEntity request}) async {
    try {
      final RegisterModel model = await remoteDataSource.registerUser(request);

      // Cache user data locally if needed
      localDataSource.setUserId(model.user.id);

      return Right(model.toEntity());
    } on APIException catch (e) {
      Log.error("API Exception during registration: ${e.message}");
      return Left(APIException(message: e.message, statusCode: e.statusCode));
    } on StorageException catch (e) {
      Log.error("Storage Exception during registration: ${e.message}");
      return Left(StorageException(message: e.message));
    } catch (e, stackTrace) {
      Log.error(
          "Unexpected error in RegisterRepositoryImpl during registration",
          e,
          stackTrace);
      return Left(APIException(message: e.toString(), statusCode: -1));
    }
  }
}
