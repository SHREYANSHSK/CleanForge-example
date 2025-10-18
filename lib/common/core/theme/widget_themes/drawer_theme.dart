import 'package:flutter/material.dart';
import 'package:example/common/resources/app_resources/app_colors.dart';

class RDrawerTheme {
  RDrawerTheme._();

  static DrawerThemeData lightDrawerTheme = const DrawerThemeData(
    elevation: 2,
    shadowColor: AppColors.primaryLight,
    backgroundColor: AppColors.white,
    surfaceTintColor: AppColors.primary,
    scrimColor: AppColors.black3,
  );

  static DrawerThemeData darkDrawerTheme = const DrawerThemeData(
    elevation: 2,
    backgroundColor: AppColors.black6,
    surfaceTintColor: AppColors.primary,
    scrimColor: AppColors.black,
  );
}
