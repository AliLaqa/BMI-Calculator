import 'package:bmi_calculator/core/get_result_sp_service.dart';
import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/dashboard_screen.dart';
import 'package:bmi_calculator/views/saved_results_screen.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/custom_buttons.dart';
import 'package:bmi_calculator/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: themeColors.backgroundColor.value,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///AppBar - Nested Column
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: AppBar1(
                      onProfilePressed: () {
                        Get.off(()=>DashBoardScreen());
                      },
                      onSettingsPressed: () {
                        Get.off(()=> SettingsScreen());
                      },
                    ),
                  ),

                  Text("Settings", style: TextStyle(
                      color: themeColors.blackColor.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      overflow: TextOverflow.ellipsis
                  ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
          /// Body - Nested Column
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ///Spacer
                    // const Spacer(),
                    ///DarkMode Button
                    // CustomButton(
                    //   onPressed: (){},
                    //   title: "Dark Mode >",
                    //   bgColor: themeColors.primaryColor.value,
                    // ),
                    const Space20(),
                    ///Saved Results Button
                    CustomButton(
                      onPressed: ()async{
                        await getResults();
                        Get.off(()=> SavedResultsScreen());
                      },
                      title: "Saved results >",
                      bgColor: themeColors.primaryColor.value,
                    ),

                    const Space20(),
                    const Space20(),
                    const Space20(),

                    // ///SignOut Button
                    // CustomButton(
                    //   onPressed: (){},
                    //   title: "Sign out",
                    //   bgColor: themeColors.accentColor.value,
                    //   borderRadius: 20,),

                    const Space20(),
                    const Space10(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
