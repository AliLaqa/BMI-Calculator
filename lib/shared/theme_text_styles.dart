import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextStyles {
  ///Theme colors instance
  static RxThemeColors themeColors = Get.find<RxThemeColors>();

  static TextStyle headings() {
    return TextStyle(
        color: themeColors.blackColor.value,
        fontWeight: FontWeight.bold,
        fontSize: 20,
    overflow: TextOverflow.clip);
  }

  static TextStyle smallBlack() {
    return TextStyle(
        color: themeColors.blackColor.value,
        fontWeight: FontWeight.bold,
        fontSize: 15, overflow: TextOverflow.clip);
  }

  static TextStyle smallAccent() {
    return TextStyle(
        color: themeColors.tertiaryColor.value,
        fontWeight: FontWeight.bold,
        fontSize: 16,
    overflow: TextOverflow.clip);
  }

  static TextStyle smallPrimary() {
    return TextStyle(
        color: themeColors.primaryColor.value,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.clip);
  }

  static TextStyle button() {
    return TextStyle(
        color: themeColors.whiteColor.value,
        fontWeight: FontWeight.bold,
        fontSize: 23);
  }
}
