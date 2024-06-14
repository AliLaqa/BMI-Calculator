import 'package:bmi_calculator/core/calculate_bmi_service.dart';
import 'package:bmi_calculator/core/clear_popping_service.dart';
import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/result_screen.dart';
import 'package:bmi_calculator/views/settings_screen.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/custom_buttons.dart';
import 'package:bmi_calculator/widgets/custom_form_row.dart';
import 'package:bmi_calculator/widgets/select_gender_button.dart';
import 'package:bmi_calculator/widgets/spacers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  ///Form Key for validation
  // final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: themeColors.backgroundColor.value,
      body: Obx(() => Form(
          key: variables.formKey.value,
          child: SingleChildScrollView(
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
                      ///Clearing data.
                      clearDataWhilePopping();
                      ///Resetting Form Validation key
                      variables.formKey.value.currentState!.reset();
                    },
                    onSettingsPressed: () {
                      Get.off(() => SettingsScreen());
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
                      Text(
                        "Let's help you get started!",
                        style: TextStyles.headings(),
                        overflow: TextOverflow.clip,
                      ),

                      const Space20(),

                      ///Select Gender Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Select Gender :",
                          style: TextStyles.headings(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      ///Gender Selection Buttons Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ///Male
                          Obx(
                            () => SelectGenderButton(
                              onPressed: () {
                                variables.selectedGender.value =
                                    variables.genderList[0];
                                print(
                                    "selectedGender : ${variables.selectedGender.value}");
                              },
                              title: variables.genderList[0],
                              icon: Icons.male_rounded,
                              bgColor: variables.selectedGender.value == "Male"
                                  ? themeColors.whiteColor.value
                                  : themeColors.lightGreyColor.value,
                            ),
                          ),

                          ///Female
                          Obx(
                            () => SelectGenderButton(
                              onPressed: () {
                                variables.selectedGender.value =
                                    variables.genderList[1];
                                print(
                                    "selectedGender : ${variables.selectedGender.value}");
                              },
                              title: variables.genderList[1],
                              icon: Icons.female_rounded,
                              bgColor:
                                  variables.selectedGender.value == "Female"
                                      ? themeColors.whiteColor.value
                                      : themeColors.lightGreyColor.value,
                            ),
                          ),

                          /// Michael Jackson
                          Obx(
                            () => SelectGenderButton(
                              onPressed: () {
                                variables.selectedGender.value =
                                    variables.genderList[2];
                                print(
                                    "selectedGender : ${variables.selectedGender.value}");
                              },
                              title: variables.genderList[2],
                              icon: Icons.transgender_sharp,
                              bgColor: variables.selectedGender.value == "Other" // aka Pak Army
                                  ? themeColors.whiteColor.value
                                  : themeColors.lightGreyColor.value,
                            ),
                          ),
                        ],
                      ),

                      const Space20(),

                      ///Enter Weight Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Your Weight :",
                          style: TextStyles.headings(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Space10(),
                      Obx(() => CustomFormRow(
                            textHint: "Enter weight",
                            dropdownValue: variables.selectedWeightType,
                            textController:
                                variables.enterWeightTextController.value,
                            dropdownItems: [
                              variables.kg,
                              variables.gram,
                            ],
                            onDropdownChanged: (String? newValue) {
                              if (newValue != null) {
                                variables.selectedWeightType.value = newValue;
                                print(
                                    "selectedWeightType : ${variables.selectedWeightType.value}");
                              }
                            },
                            emptyValueMessage: "Weight not entered",
                            wrongValueMessage:
                                "Please enter in ${variables.selectedWeightType.value}",
                          )),

                      const Space20(),

                      ///Enter Age Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Your Age :",
                          style: TextStyles.headings(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Space10(),
                      Obx(
                        () => AgeFormField(
                          textHint: "Enter your age",
                          textController:
                              variables.enterAgeTextController.value,
                          emptyValueMessage: "Age not entered",
                          wrongValueMessage: 'Please enter years in digit',
                        ),
                      ),

                      const Space20(),

                      ///Enter Height Section
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Enter Your Height :",
                          style: TextStyles.headings(),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const Space10(),
                      Obx(() => CustomFormRow(
                            textHint: "Enter height",
                            dropdownValue: variables.selectedHeightType,
                            textController:
                                variables.enterHeightTextController.value,
                            dropdownItems: [
                              variables.cm.value,
                              variables.meter.value,
                            ],
                            onDropdownChanged: (String? newValue) {
                              if (newValue != null) {
                                variables.selectedHeightType.value = newValue;
                                print(
                                    "selectedHeightType : ${variables.selectedHeightType.value}");
                              }
                            },
                            emptyValueMessage: "Height not entered",
                            wrongValueMessage:
                                "Please enter in ${variables.selectedHeightType.value}",
                          )),

                      const Space20(),

                      ///Calculate Button
                      CustomButton(
                        onPressed: () {
                          calculateBMI();
                        },
                        title: "Calculate",
                        bgColor: themeColors.primaryColor.value,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

