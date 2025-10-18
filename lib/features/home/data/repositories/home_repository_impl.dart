import 'package:dartz/dartz.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';
import 'package:example/common/core/utils/type_def/type_def.dart';
import 'package:example/features/home/data/datasources/remote/home_remote_datasource.dart';
import 'package:example/features/home/data/datasources/local/home_local_datasource.dart';
import 'package:example/features/home/data/models/home_model.dart';
import 'package:example/features/home/data/models/logout_model.dart';
import 'package:example/features/home/domain/entities/home_entity.dart';
import 'package:example/features/home/domain/entities/logout_entity.dart';
import 'package:example/features/home/domain/repositories/home_repository.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';

/// [HomeRepositoryImpl] implements the repository layer in clean architecture
/// Manages data operations between remote and local data sources
/// Best Practice: Implements error handling, data transformation, and source selection
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  final HomeLocalDataSource localDataSource;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  ResultFuture<UserDataEntity> getUserData() async {
    try {
      final UserDataModel model = await remoteDataSource.fetchHomeData();

      return Right(model.toEntity()); // convert to domain entity
    } on APIException catch (e) {
      Log.error("API Exception: ${e.message}");
      return Left(APIException(message: e.message, statusCode: e.statusCode));
    } on StorageException catch (e) {
      Log.error("Storage Exception: ${e.message}");
      return Left(StorageException(message: e.message));
    } catch (e, stackTrace) {
      Log.error("Unexpected error in HomeRepositoryImpl", e, stackTrace);
      return Left(APIException(message: e.toString(), statusCode: -1));
    }
  }

  @override
  ResultFuture<LogOutUserEntity> logoutUser() async {
    try {
      final LogOutUserModel model = await remoteDataSource.logoutUser();
      await localDataSource.clearAll();

      return Right(model.toEntity()); // convert to domain entity
    } on APIException catch (e) {
      Log.error("API Exception: ${e.message}");
      return Left(APIException(message: e.message, statusCode: e.statusCode));
    } on StorageException catch (e) {
      Log.error("Storage Exception: ${e.message}");
      return Left(StorageException(message: e.message));
    } catch (e, stackTrace) {
      Log.error("Unexpected error in HomeRepositoryImpl", e, stackTrace);
      return Left(APIException(message: e.toString(), statusCode: -1));
    }
  }
}
