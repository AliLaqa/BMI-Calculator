import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectGenderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String title;
  final Color bgColor;
  SelectGenderButton({super.key, required this.onPressed, required this.title, required this.icon, required this.bgColor});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          height: 65,
          width: 70,
          decoration: BoxDecoration(
            color: bgColor,
                borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: themeColors.blackColor.value.withOpacity(0.5),
                blurRadius: 2,
                spreadRadius: 2,
                offset: const Offset(1, 1),
              )
            ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon, color: themeColors.primaryColor.value, size: 36,),
              Text(title, style: TextStyles.smallBlack(),),
              const SizedBox(height: 5,),
            ],
          ),
        ),
    );
  }
}
