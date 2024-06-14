import 'package:bmi_calculator/core/calculate_bmi_service.dart';
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
      body: Obx(
        () => Form(
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
                      Get.off(() => DashBoardScreen());
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
                                  : themeColors.tertiaryColor.value,
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
                                      : themeColors.tertiaryColor.value,
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
                                  : themeColors.tertiaryColor.value,
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

      ///Here
    ));
  }
}


///Example : Apply condition based on variable data type
//if(variables.enterAgeTextController.value.text.trim() is String){ }


///Backup
//import 'package:bmi_calculator/core/calculate_bmi_service.dart';
// import 'package:bmi_calculator/shared/theme_colors.dart';
// import 'package:bmi_calculator/shared/theme_text_styles.dart';
// import 'package:bmi_calculator/shared/variables.dart';
// import 'package:bmi_calculator/views/result_screen.dart';
// import 'package:bmi_calculator/views/settings_screen.dart';
// import 'package:bmi_calculator/widgets/custom_appbar.dart';
// import 'package:bmi_calculator/widgets/custom_buttons.dart';
// import 'package:bmi_calculator/widgets/custom_form_row.dart';
// import 'package:bmi_calculator/widgets/select_gender_button.dart';
// import 'package:bmi_calculator/widgets/spacers.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class DashBoardScreen extends StatelessWidget {
//   DashBoardScreen({super.key});
//
//   ///Theme colors instance
//   final RxThemeColors themeColors = Get.find<RxThemeColors>();
//
//   ///Variables instance
//   final RxVariables variables = Get.find<RxVariables>();
//
//   ///Form Key for validation
//   // final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       backgroundColor: themeColors.backgroundColor.value,
//       body: Obx(
//         () => Form(
//           key: variables.formKey.value,
//           child: SingleChildScrollView(
//             clipBehavior: Clip.none,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ///AppBar
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: AppBar1(
//                     onProfilePressed: () {
//                       Get.off(() => DashBoardScreen());
//                     },
//                     onSettingsPressed: () {
//                       Get.off(() => SettingsScreen());
//                     },
//                   ),
//                 ),
//
//                 ///Nested Column
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 20,
//                     right: 20,
//                     bottom: 20,
//                     top: 5,
//                   ),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Let's help you get started!",
//                         style: TextStyles.headings(),
//                         overflow: TextOverflow.clip,
//                       ),
//
//                       const Space20(),
//
//                       ///Select Gender Section
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Select Gender :",
//                           style: TextStyles.headings(),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//
//                       ///Gender Selection Buttons Row
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           ///Male
//                           Obx(
//                             () => SelectGenderButton(
//                               onPressed: () {
//                                 variables.selectedGender.value =
//                                     variables.genderList[0];
//                                 print(
//                                     "selectedGender : ${variables.selectedGender.value}");
//                               },
//                               title: variables.genderList[0],
//                               icon: Icons.male_rounded,
//                               bgColor: variables.selectedGender.value == "Male"
//                                   ? themeColors.whiteColor.value
//                                   : themeColors.tertiaryColor.value,
//                             ),
//                           ),
//
//                           ///Female
//                           Obx(
//                             () => SelectGenderButton(
//                               onPressed: () {
//                                 variables.selectedGender.value =
//                                     variables.genderList[1];
//                                 print(
//                                     "selectedGender : ${variables.selectedGender.value}");
//                               },
//                               title: variables.genderList[1],
//                               icon: Icons.female_rounded,
//                               bgColor:
//                                   variables.selectedGender.value == "Female"
//                                       ? themeColors.whiteColor.value
//                                       : themeColors.tertiaryColor.value,
//                             ),
//                           ),
//
//                           /// Michael Jackson
//                           Obx(
//                             () => SelectGenderButton(
//                               onPressed: () {
//                                 variables.selectedGender.value =
//                                     variables.genderList[2];
//                                 print(
//                                     "selectedGender : ${variables.selectedGender.value}");
//                               },
//                               title: variables.genderList[2],
//                               icon: Icons.transgender_sharp,
//                               bgColor: variables.selectedGender.value == "Other"
//                                   ? themeColors.whiteColor.value
//                                   : themeColors.tertiaryColor.value,
//                             ),
//                           ),
//                         ],
//                       ),
//
//                       const Space20(),
//
//                       ///Enter Weight Section
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Enter Your Weight :",
//                           style: TextStyles.headings(),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const Space10(),
//                       Obx(() => CustomFormRow(
//                             textHint: "Enter weight",
//                             dropdownValue: variables.selectedWeightType,
//                             textController:
//                                 variables.enterWeightTextController.value,
//                             dropdownItems: [
//                               variables.kg,
//                               variables.gram,
//                             ],
//                             onDropdownChanged: (String? newValue) {
//                               if (newValue != null) {
//                                 variables.selectedWeightType.value = newValue;
//                                 print(
//                                     "selectedWeightType : ${variables.selectedWeightType.value}");
//                               }
//                             },
//                             emptyValueMessage: "Weight not entered",
//                             wrongValueMessage:
//                                 "Please enter in ${variables.selectedWeightType.value}",
//                           )),
//
//                       const Space20(),
//
//                       ///Enter Age Section
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Enter Your Age :",
//                           style: TextStyles.headings(),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const Space10(),
//                       Obx(
//                         () => AgeFormField(
//                           textHint: "Enter your age",
//                           textController:
//                               variables.enterAgeTextController.value,
//                           emptyValueMessage: "Age not entered",
//                           wrongValueMessage: 'Please enter years in digit',
//                         ),
//                       ),
//
//                       const Space20(),
//
//                       ///Enter Height Section
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text(
//                           "Enter Your Height :",
//                           style: TextStyles.headings(),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const Space10(),
//                       Obx(() => CustomFormRow(
//                             textHint: "Enter height",
//                             dropdownValue: variables.selectedHeightType,
//                             textController:
//                                 variables.enterHeightTextController.value,
//                             dropdownItems: [
//                               variables.cm.value,
//                               variables.meter.value,
//                             ],
//                             onDropdownChanged: (String? newValue) {
//                               if (newValue != null) {
//                                 variables.selectedHeightType.value = newValue;
//                                 print(
//                                     "selectedHeightType : ${variables.selectedHeightType.value}");
//                               }
//                             },
//                             emptyValueMessage: "Height not entered",
//                             wrongValueMessage:
//                                 "Please enter in ${variables.selectedHeightType.value}",
//                           )),
//
//                       const Space20(),
//
//                       ///Calculate Button
//                       CustomButton(
//                         onPressed: () {
//
//                           if (variables.selectedGender.isNotEmpty &&
//                               variables.formKey.value.currentState!
//                                   .validate()) {
//                             print('Gender selected and Input is valid');
//
//                             ///Proceed with functionality
//                             //Calculate BMI
//                             print(
//                                 "selectedGender: ${variables.selectedGender.value}, \n"
//                                 "selectedWeightType : ${variables.selectedWeightType.value}, "
//                                 "enterWeightTextController : ${variables.enterWeightTextController.value.text}, \n"
//                                 "enterAgeTextController : ${variables.enterAgeTextController.value.text}, \n"
//                                 "selectedHeightType : ${variables.selectedHeightType.value}, "
//                                 "enterHeightTextController : ${variables.enterHeightTextController.value.text}\n");
//
//                             //Storing Weight as Int
//                             variables.weightInt.value = double.parse(variables
//                                 .enterWeightTextController.value.text
//                                 .trim());
//                             //Storing Age as Int
//                             variables.ageInt.value = double.parse(variables
//                                 .enterAgeTextController.value.text
//                                 .trim());
//                             //Storing Height as Int
//                             variables.heightInt.value = double.parse(variables
//                                 .enterHeightTextController.value.text
//                                 .trim());
//
//                             ///Convert cm to meter (height = height / 100;)
//                             if (variables.selectedWeightType.value == "Gram") {
//                               variables.weightInt.value =
//                                   variables.weightInt.value / 1000;
//                               if (kDebugMode) {
//                                 print("weightInt to Kg : ${variables.weightInt.value}");
//                               }
//                             }
//
//                             ///Convert Gram to Kilogram (weight = weight / 1000;)
//                             if (variables.selectedHeightType.value == "cm") {
//                               variables.heightInt.value =
//                                   variables.heightInt.value / 100;
//                               if (kDebugMode) {
//                                 print("heightInt to meter : ${variables.heightInt.value}\n");
//                               }
//                             }
//
//                             ///Convert-Store meter to meter square(meter * 2)/(height * height)
//                             variables.heightMeterSqInt.value =
//                                 variables.heightInt.value *
//                                     variables.heightInt.value;
//                             print("heightMeterSqInt : ${variables.heightMeterSqInt.value}");
//
//                             ///Store weight in kg
//                             variables.weightKgInt.value =
//                                 variables.weightInt.value;
//                             print("weightKgInt : ${variables.weightKgInt.value}\n");
//
//                             ///Calculate BMI (BMI = weight.kg / height.meterSq)
//                             variables.unformattedBMi.value = variables.weightKgInt.value /
//                                 variables.heightMeterSqInt.value;
//                             ///Formatting BMI value to one decimal point
//                             variables.unformattedBMiString.value = variables.unformattedBMi.value.toStringAsFixed(1);
//                             ///Storing formatted BMI value
//                             variables.bMI.value = double.parse(variables.unformattedBMiString.value);
//                             print("bMi : ${variables.bMI.value}");
//
//                             ///Navigate to ResultScreen
//                             Get.off(()=> ResultScreen(selectedGender: variables.selectedGender.value));
//                           } else if (variables.selectedGender.isEmpty) {
//                             ///Empty Gender checker
//                             Get.snackbar("Gender not selected",
//                                 "Please select your gender");
//                             print(
//                                 "Gender not selected, selectedGender : ${variables.selectedGender.value}");
//                           }
//                         },
//                         title: "Calculate",
//                         bgColor: themeColors.primaryColor.value,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       ///Here
//     ));
//   }
// }