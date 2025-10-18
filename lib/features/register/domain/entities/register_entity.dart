/// [RegisterEntity] represents the core domain entity for user registration
/// Demonstrates Clean Architecture's domain layer with pure business logic
/// Best Practice: Keep entities independent of external dependencies
class RegisterEntity {
  final RegisterUserEntity user;
  final String message;
  final bool success;

  RegisterEntity({
    required this.user,
    required this.message,
    required this.success,
  });
}

class RegisterUserEntity {
  final String id;
  final String username;
  final String email;
  final String role;
  final String loginType;
  final bool isEmailVerified;
  final String createdAt;
  final String updatedAt;
  final RegisterAvatarEntity avatar;

  RegisterUserEntity({
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

class RegisterAvatarEntity {
  final String url;
  final String localPath;
  final String id;

  RegisterAvatarEntity({
    required this.url,
    required this.localPath,
    required this.id,
  });
}
