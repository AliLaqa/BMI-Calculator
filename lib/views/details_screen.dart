import 'package:bmi_calculator/core/get_today_date_service.dart';
import 'package:bmi_calculator/core/save_result_sp_service.dart';
import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/dashboard_screen.dart';
import 'package:bmi_calculator/views/settings_screen.dart';
import 'package:bmi_calculator/widgets/bmi_gender_chart.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/custom_buttons.dart';
import 'package:bmi_calculator/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  final String selectedGender;
  DetailsScreen({super.key, required this.selectedGender});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: themeColors.backgroundColor.value,
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ///AppBar
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: AppBar1(
                onProfilePressed: () {
                  Get.off(()=> DashBoardScreen());
                },
                onSettingsPressed: () {
                  Get.off(()=> SettingsScreen());
                },
              ),
            ),

            ///Nested Column
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 20,
                top: 5,
              ),
              child: Column(
                children: [
                  const Space20(),

                  ///Your BMI Container
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Container(
                      height: 130,
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: themeColors.whiteColor.value,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: themeColors.tertiaryColor.value,
                            width: 1.0,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: themeColors.secondaryColor.value,
                              blurRadius: 2,
                              spreadRadius: 3,
                              offset: const Offset(1, 2),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                              Text("Your BMI ",
                                  style: TextStyle(
                                    color: themeColors.tertiaryColor.value,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    overflow: TextOverflow.clip,
                                  )),

                              ///BMI Value Large Text
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(variables.bMI.value.toString(),
                                    style: TextStyle(
                                      fontSize: 40, color: themeColors.tertiaryColor.value,
                                      overflow: TextOverflow.clip,
                                    ),
                                  softWrap: true,
                                ),
                              ),
                              Text(" ${variables.bodyType}",
                                  style: TextStyles.smallPrimary()),
                        ],
                      ),
                    ),
                  ),

                  ///BMI Chart Section
                  BMIGenderChart(selectedGender: selectedGender),

                 const Space20(),
                 const Space20(),

                  ///Summary Button
                  CustomButton(
                    onPressed: ()async {
                      getTodayDate();
                      await saveResult();
                      Get.to(()=> SettingsScreen());
                    },
                    title: "Save Results",
                    bgColor: themeColors.primaryColor.value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
