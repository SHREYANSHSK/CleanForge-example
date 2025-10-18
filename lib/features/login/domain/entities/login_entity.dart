class LoginEntity {
  final LoginUserEntity user;
  final String accessToken;
  final String refreshToken;
  final String message;
  final bool success;

  LoginEntity({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
    required this.message,
    required this.success,
  });
}

class LoginUserEntity {
  final String id;
  final String username;
  final String email;
  final String role;
  final String loginType;
  final bool isEmailVerified;
  final String createdAt;
  final String updatedAt;
  final LoginAvatarEntity avatar;

  LoginUserEntity({
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

class LoginAvatarEntity {
  final String url;
  final String localPath;
  final String id;

  LoginAvatarEntity({
    required this.url,
    required this.localPath,
    required this.id,
  });
}
