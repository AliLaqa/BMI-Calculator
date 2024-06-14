import 'package:bmi_calculator/core/calculate_bodytype_service.dart';
import 'package:bmi_calculator/core/clear_popping_service.dart';
import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/dashboard_screen.dart';
import 'package:bmi_calculator/views/details_screen.dart';
import 'package:bmi_calculator/views/settings_screen.dart';
import 'package:bmi_calculator/widgets/circular_bmi_indicator.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/custom_buttons.dart';
import 'package:bmi_calculator/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultScreen extends StatelessWidget {
  final String selectedGender;
  ResultScreen({super.key, required this.selectedGender});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  ///Convert BMI for Progress Indicator's progress, progress should be between 1.0 to 0.0
  calculateIndicatorProgress(){
   variables.indicatorProgress.value = variables.bMI.value / 100.0;
   print("indicatorProgress : ${variables.indicatorProgress.value}");
  }


  @override
  Widget build(BuildContext context) {
    ///Calculating Progress of progress Indicator
    calculateIndicatorProgress();
    ///Calculating BodyType with BMI result
    calculateBodyType();
    ///PopScope to navigate to/add DashboardScreen when back is pressed,
    ///instead of exiting the app for better UX.
    return PopScope(
      canPop: false, //Set to false to stop app pop.
      onPopInvoked: (canPop) async {
        ///Clearing data while navigating to DashBoardScreen.
        clearDataWhilePopping();
        await Get.off(()=> DashBoardScreen());
      },
      child: SafeArea(
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
                  onProfilePressed: ()async {
                    ///Clearing data while navigating to DashBoardScreen.
                    clearDataWhilePopping();
                    await Get.off(()=> DashBoardScreen());
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
                    Text(
                      "BMI RESULTS",
                      style: TextStyle(
                        color: themeColors.blackColor.value,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: 0.1,
                      ),
                      overflow: TextOverflow.clip,
                    ),

                    const Space20(),

                    /// Progress indicator BMI Section
                    CustomCircularProgressIndicator(
                        bgColor: themeColors.secondaryColor.value,
                        indicatorProgress: variables.indicatorProgress, //max 1.0
                        progressColor: themeColors.primaryColor.value,
                        bMI: variables.bMI),

                    const Space20(),

                    ///Showing body type Section
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(text: "You have a ", style: TextStyles.headings()),
                        ///Body Type Text
                        TextSpan(
                            text: variables.bodyType.value,
                            style: TextStyles.smallPrimary()),
                        TextSpan(
                            text: " body!", style: TextStyles.headings()),
                      ]),
                    ),


                    const Space20(),
                    const Space20(),
                    const Space20(),
                    const Space10(),

                    ///Summary Button
                    CustomButton(
                      onPressed: () {
                        Get.to(()=> DetailsScreen(selectedGender: selectedGender,));
                      },
                      title: "Summary >",
                      bgColor: themeColors.primaryColor.value,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
