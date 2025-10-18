
import 'package:example/features/home/domain/entities/home_entity.dart';

class LogInUserModel extends LogInUserEntity {
  LogInUserModel({
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

  factory LogInUserModel.fromJson(Map<String, dynamic> json) {
    return LogInUserModel(
      id: json['_id'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] as String? ?? '',
      loginType: json['loginType'] as String? ?? '',
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
      avatar: RegisterAvatarModel.fromJson(
          json['avatar'] as Map<String, dynamic>? ?? {}),
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
      'avatar': (avatar as RegisterAvatarModel).toJson(),
    };
  }

  LogInUserEntity toEntity() {
    return LogInUserEntity(
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

class RegisterAvatarModel extends LogInAvatarEntity {
  RegisterAvatarModel({
    required super.url,
    required super.localPath,
    required super.id,
  });

  factory RegisterAvatarModel.fromJson(Map<String, dynamic> json) {
    return RegisterAvatarModel(
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

  LogInAvatarEntity toEntity() {
    return LogInAvatarEntity(
      url: url,
      localPath: localPath,
      id: id,
    );
  }
}

class UserDataModel extends UserDataEntity {
  UserDataModel({
    required super.user,
    required super.message,
    required super.success,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};

    return UserDataModel(
      user: LogInUserModel.fromJson(data),
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'user': (user as LogInUserModel).toJson(),
      },
      'message': message,
      'success': success,
    };
  }

  UserDataEntity toEntity() {
    return UserDataEntity(
      user: user,
      message: message,
      success: success,
    );
  }

  factory UserDataModel.fromEntity(UserDataEntity entity) {
    return UserDataModel(
      user: entity.user,
      message: entity.message,
      success: entity.success,
    );
  }
}
