import 'package:example/common/resources/app_resources/app_colors.dart';
import 'package:example/common/resources/app_resources/app_gaps.dart';
import 'package:example/common/resources/app_resources/app_sizes.dart';
import 'package:example/common/resources/app_resources/app_strings.dart';
import 'package:example/features/home/presentation/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWidget extends GetView<HomeController> {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userData = controller.state.homeData.value;
      if (userData != null) {
        return Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            /// Using Theme's text styles for proper theme switching
             Text(
               AppStrings.homeDescText,
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.headlineLarge,
             ),

             AppGaps.h10,

             Text(
               AppStrings.homeNoteText,
               textAlign: TextAlign.center,
               style: Theme.of(context).textTheme.bodyLarge,
             ),

            AppGaps.h50,


            Container(
              padding: EdgeInsets.all(AppSizes.w16),
              decoration: BoxDecoration(
                color: AppColors.greenbg,
                borderRadius: BorderRadius.circular(AppSizes.r8),
                border: Border.all(color: AppColors.green),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ///NOTE: If you want the widget to follow global theme than just pass the required value
                  const Text(
                    'Login Successful!',
                  ),
                  AppGaps.h8,
                  Text(
                    'User ID: ${userData.user.id}',
                  ),
                  Text(
                    'Username: ${userData.user.username}',
                  ),
                  Text(
                    'Email: ${userData.user.email}',
                  ),
                  Text(
                    'Role: ${userData.user.role}',
                  ),
                ],
              ),
            ),
          ],
        );
      }
      return const Text("No Data");
    });
  }
}
