import 'package:example/features/register/domain/entities/register_entity.dart';

/// [RegisterUserModel] implements data layer transformation in clean architecture
/// Handles JSON serialization/deserialization and entity conversion
/// Best Practice: Keeps data transformation logic separate from business logic
class RegisterUserModel extends RegisterUserEntity {
  RegisterUserModel({
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

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
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

  RegisterUserEntity toEntity() {
    return RegisterUserEntity(
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

class RegisterAvatarModel extends RegisterAvatarEntity {
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

  RegisterAvatarEntity toEntity() {
    return RegisterAvatarEntity(
      url: url,
      localPath: localPath,
      id: id,
    );
  }
}

class RegisterModel extends RegisterEntity {
  RegisterModel({
    required super.user,
    required super.message,
    required super.success,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? {};
    final userData = data['user'] as Map<String, dynamic>? ?? {};

    return RegisterModel(
      user: RegisterUserModel.fromJson(userData),
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': {
        'user': (user as RegisterUserModel).toJson(),
      },
      'message': message,
      'success': success,
    };
  }

  RegisterEntity toEntity() {
    return RegisterEntity(
      user: user,
      message: message,
      success: success,
    );
  }

  factory RegisterModel.fromEntity(RegisterEntity entity) {
    return RegisterModel(
      user: entity.user,
      message: entity.message,
      success: entity.success,
    );
  }
}
