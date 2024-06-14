import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///Added optional border Radius
class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color bgColor;
  final double borderRadius;

  CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.bgColor,
      this.borderRadius = 10});

  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyles.button(),
          overflow: TextOverflow.ellipsis,
        )),
      ),
    );
  }
}

