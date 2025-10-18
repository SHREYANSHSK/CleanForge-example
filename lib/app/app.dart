import 'package:example/common/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:example/app/app_binding.dart';
import 'package:example/common/core/theme/theme_controller.dart';
import 'package:example/routes/app_pages.dart';
import 'package:example/common/core/utils/navigator_observer/app_navigator_observer.dart';
import 'package:example/app/pageNotFound.dart';
import 'package:example/common/resources/app_resources/app_sizes.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:example/routes/app_routes.dart';

/// [App] is the root widget of CleanForge example, demonstrating clean architecture principles
/// by setting up theme, routing, navigation observers, and global app configurations.
/// Best Practice: Centralizes app-wide configurations in a single widget for better maintainability
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
        designSize: AppSizes.designSize,
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Obx(() => GetMaterialApp(
                title: 'example',
                initialBinding: AppBinding(),
                initialRoute: AppPages.initial,
                getPages: AppPages.pages,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: ThemeController.currentTheme.value,
                unknownRoute: GetPage(
                  name: AppRoutes.pageNotFound,
                  page: () => const PageNotFound(),
                ),
                navigatorObservers: [AppNavigatorObserver()],
                useInheritedMediaQuery: true,
              ));
        },
      ),
    );
  }
}
