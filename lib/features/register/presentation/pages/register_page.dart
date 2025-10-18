import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/register/presentation/controllers/register_controller.dart';
import 'package:example/features/register/presentation/widgets/register_widget.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register Page')),
      body: Obx(() {
        if (controller.state.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return const RegisterWidget();
      }),
    );
  }
}
