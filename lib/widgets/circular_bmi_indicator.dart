import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color bgColor;
  final RxDouble indicatorProgress;
  final Color progressColor;
  final RxDouble bMI;

  CustomCircularProgressIndicator({
    super.key,
    required this.bgColor,
    required this.indicatorProgress,
    required this.progressColor,
    required this.bMI,
  });

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(16),
      // margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color:bgColor,
        borderRadius: BorderRadius.circular(120),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 150,
                height: 150,
                child: Obx(() {
                  return CircularProgressIndicator(
                    value: indicatorProgress.value,
                    color: progressColor,
                    backgroundColor: themeColors.whiteColor.value,
                    strokeWidth: 18,
                    strokeCap: StrokeCap.round,
                  );
                }),
              ),
              Obx(() {
                return Text(
                  bMI.value.toStringAsFixed(1),
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
