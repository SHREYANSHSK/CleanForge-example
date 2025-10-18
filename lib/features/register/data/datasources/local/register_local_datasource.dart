import 'package:example/common/resources/storage_resources/local_client.dart';
import 'package:example/common/resources/storage_resources/local_keys.dart';
import 'package:example/common/core/utils/errors/exceptions.dart';
import 'package:example/common/core/utils/logger/app_logger.dart';

abstract class RegisterLocalDataSource {
  Future<void> setUserId(String userId);
  Future<void> clearAll();
}

class RegisterLocalDataSourceImpl implements RegisterLocalDataSource {
  @override
  Future<void> setUserId(String userId) async {
    try {
      await LocalClient.saveString(
        key: LocalKeys.userId,
        value: userId,
      );
      Log.info("User ID saved successfully");
    } catch (e, stackTrace) {
      Log.error("Error saving user ID", e, stackTrace);
      throw const StorageException(message: "Failed to save user ID");
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await LocalClient.clearAll();
      Log.info("Local data cleared successfully");
    } catch (e, stackTrace) {
      Log.error("Error clearing local data", e, stackTrace);
      throw const StorageException(message: "Failed to clear local data");
    }
  }
}
