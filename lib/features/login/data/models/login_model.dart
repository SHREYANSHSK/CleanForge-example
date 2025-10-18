import 'package:example/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
    required super.user,
    required super.accessToken,
    required super.refreshToken,
    required super.message,
    required super.success,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    final userData = data['user'] as Map<String, dynamic>? ?? {};

    return LoginModel(
      user: LoginUserModel.fromJson(userData),
      accessToken: data['accessToken'] as String? ?? '',
      refreshToken: data['refreshToken'] as String? ?? '',
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'user': (user as LoginUserModel).toJson(),
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      },
      'message': message,
      'success': success,
    };
  }

  LoginEntity toEntity() {
    return LoginEntity(
      user: user,
      accessToken: accessToken,
      refreshToken: refreshToken,
      message: message,
      success: success,
    );
  }

  factory LoginModel.fromEntity(LoginEntity entity) {
    return LoginModel(
      user: entity.user,
      accessToken: entity.accessToken,
      refreshToken: entity.refreshToken,
      message: entity.message,
      success: entity.success,
    );
  }
}

class LoginUserModel extends LoginUserEntity {
  LoginUserModel({
    required super.id,
    required super.username,
    required super.email,
    required super.role,
    required super.loginType,
    required super.isEmailVerified,
    required super.createdAt,
    required super.updatedAt,
    required super.avatar,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      id: json['_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? '',
      loginType: json['loginType'] as String? ?? '',
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      avatar: LoginAvatarModel.fromJson(json['avatar'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'role': role,
      'loginType': loginType,
      'isEmailVerified': isEmailVerified,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'avatar': (avatar as LoginAvatarModel).toJson(),
    };
  }

  LoginUserEntity toEntity() {
    return LoginUserEntity(
      id: id,
      username: username,
      email: email,
      role: role,
      loginType: loginType,
      isEmailVerified: isEmailVerified,
      createdAt: createdAt,
      updatedAt: updatedAt,
      avatar: avatar,
    );
  }
}

class LoginAvatarModel extends LoginAvatarEntity {
  LoginAvatarModel({
    required super.url,
    required super.localPath,
    required super.id,
  });

  factory LoginAvatarModel.fromJson(Map<String, dynamic> json) {
    return LoginAvatarModel(
      url: json['url'] as String? ?? '',
      localPath: json['localPath'] as String? ?? '',
      id: json['_id'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'localPath': localPath,
      '_id': id,
    };
  }

  LoginAvatarEntity toEntity() {
    return LoginAvatarEntity(
      url: url,
      localPath: localPath,
      id: id,
    );
  }
}
