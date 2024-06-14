import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/splash_screen.dart';

void main() {
  ///Initializing GetX Controllers
  Get.put(RxThemeColors());
  Get.put(RxVariables());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
final RxThemeColors themeColors =Get.find<RxThemeColors>();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: themeColors.primaryColor.value),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}


