import 'package:example/common/resources/multimedia_resources/app_icons.dart';
import 'package:example/common/widgets/theme_switch_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/features/home/presentation/controllers/home_controller.dart';
import 'package:example/features/home/presentation/widgets/home_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        leading: const ThemeSwitchIcon(),
        actions: [
          IconButton(
              onPressed:() async => await controller.logoutUser(),
              icon: const Icon(AppIcons.logOut))
        ],
      ),
      body: Obx(() {
        if (controller.state.homeData.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return const HomeWidget();
      }),
    );
  }
}
