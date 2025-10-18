import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/login/presentation/controllers/login_controller.dart';
import 'package:example/features/login/presentation/widgets/login_widget.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Obx(() {
        if (controller.state.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return const LoginWidget();
      }),
    );
  }
}
