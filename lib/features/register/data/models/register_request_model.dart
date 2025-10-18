import 'package:example/features/register/domain/entities/register_request_entity.dart';

class RegisterRequestModel extends RegisterRequestEntity {
  RegisterRequestModel({
    required super.email,
    required super.password,
    required super.role,
    required super.username,
  });

  factory RegisterRequestModel.fromEntity(RegisterRequestEntity entity) {
    return RegisterRequestModel(
      email: entity.email,
      password: entity.password,
      role: entity.role,
      username: entity.username,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'role': role,
      'username': username,
    };
  }

  RegisterRequestEntity toEntity() {
    return RegisterRequestEntity(
      email: email,
      password: password,
      role: role,
      username: username,
    );
  }
}
