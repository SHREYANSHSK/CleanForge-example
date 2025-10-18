import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/register/domain/entities/register_entity.dart';

class RegisterState extends GetXState {
  RxBool isLoading = false.obs;
  final registerData = Rxn<RegisterEntity>();

  // Form controllers
  final emailController = TextEditingController(text: "user.email@domain.com");
  final passwordController = TextEditingController(text: "test@123");
  final usernameController = TextEditingController(text: "doejohn",);

  // Form validation
  final formKey = GlobalKey<FormState>();
}
