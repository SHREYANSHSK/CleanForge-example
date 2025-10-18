


import 'package:example/features/home/domain/entities/logout_entity.dart';

class LogOutUserModel extends LogOutUserEntity {
  LogOutUserModel({
    required super.statusCode,
    required super.message,
    required super.success,
  });

  factory LogOutUserModel.fromJson(Map<String, dynamic> json) {
    return LogOutUserModel(
      statusCode: json['statusCode'] as int? ?? -1,
      message: json['message'] as String? ?? '',
      success: json['success'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode' : statusCode,
      'message': message,
      'success': success,
    };
  }

  LogOutUserEntity toEntity() {
    return LogOutUserEntity(
      statusCode: statusCode,
      message: message,
      success: success,
    );
  }

  factory LogOutUserModel.fromEntity(LogOutUserEntity entity) {
    return LogOutUserModel(
      statusCode: entity.statusCode,
      message: entity.message,
      success: entity.success,
    );
  }
}
