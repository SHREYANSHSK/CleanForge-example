
class UserDataEntity {
  final LogInUserEntity user;
  final String message;
  final bool success;

  UserDataEntity({
    required this.user,
    required this.message,
    required this.success,
  });
}

class LogInUserEntity {
  final String id;
  final String username;
  final String email;
  final String role;
  final String loginType;
  final bool isEmailVerified;
  final String createdAt;
  final String updatedAt;
  final LogInAvatarEntity avatar;

  LogInUserEntity({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.loginType,
    required this.isEmailVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.avatar,
  });
}

class LogInAvatarEntity {
  final String url;
  final String localPath;
  final String id;

  LogInAvatarEntity({
    required this.url,
    required this.localPath,
    required this.id,
  });
}
