import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BMIGenderChart extends StatelessWidget {
  final String selectedGender;
  BMIGenderChart({super.key, required this.selectedGender});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  ///Returning Less than String in accordance to gender
  String getLessThanText(String selectedGender){
    if(selectedGender == "Male"){
      return "Less than 18.4";
    } else if(selectedGender == "Female"){
      return "Less than 18.4";
    } else {
      return "Less than 18.4";
    }
  }

  ///Returning Healthy String in accordance to gender
  String getHealthyText(String selectedGender){
    if(selectedGender == "Male"){
      return "18.5 to 25.5";
    } else if(selectedGender == "Female"){
      return "18.5 to 24.5";
    } else {
      return "18.5 to 25.5";
    }
  }

  ///Returning Overweight String in accordance to gender
  String getOverweightText(String selectedGender){
    if(selectedGender == "Male"){
      return "25.6 to 32";
    } else if(selectedGender == "Female"){
      return "24.6 to 32";
    } else {
      return "25.6 to 32";
    }
  }

  ///Returning Overweight String in accordance to gender
  String getObeseText(String selectedGender){
    if(selectedGender == "Male"){
      return "More than 32";
    } else if(selectedGender == "Female"){
      return "More than 32";
    } else {
      return "More than 32";
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: themeColors.whiteColor.value,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: themeColors.secondaryColor.value,
              blurRadius: 2,
              spreadRadius: 3,
              offset: const Offset(1, 2),
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///Underweight Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(getLessThanText(selectedGender).toString(), style: TextStyles.smallAccent(),),
              Text(variables.bodyStatusList[0], style: TextStyles.smallBlack(),),
            ],
          ),
          ///Healthy Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(getHealthyText(selectedGender).toString(), style: TextStyles.smallAccent(),),
              Text(variables.bodyStatusList[1], style: TextStyles.smallBlack(),),
            ],
          ),
          ///Overweight Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(getOverweightText(selectedGender).toString(), style: TextStyles.smallAccent(),),
              Text(variables.bodyStatusList[2], style: TextStyles.smallBlack(),),
            ],
          ),
          ///Obese Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(getObeseText(selectedGender).toString(), style: TextStyles.smallAccent(),),
              Text(variables.bodyStatusList[3], style: TextStyles.smallBlack(),),
            ],
          )
        ],
      ),
    );
  }
}
