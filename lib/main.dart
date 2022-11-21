import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/config/app_constant.dart';
import 'package:greengrocer/src/config/app_routes.dart';
import 'package:greengrocer/src/config/custom_colors.dart';
import 'package:greengrocer/src/controllers/auth_controller.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GreenGrocer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: CustomColors.customSwatchColor,
          scaffoldBackgroundColor: CustomColors.customBackgroundScaffoldColor),
      getPages: AppRoutes.routes,
      initialRoute: AppConstant.splashRoute,
    );
  }
}
