import 'package:bmi_calculator/core/clear_popping_service.dart';
import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/dashboard_screen.dart';
import 'package:bmi_calculator/widgets/custom_appbar.dart';
import 'package:bmi_calculator/widgets/custom_buttons.dart';
import 'package:bmi_calculator/widgets/spacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/shared_Preferences_helper.dart';

class SavedResultsScreen extends StatelessWidget {
  SavedResultsScreen({super.key});

  /// Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  /// Variables instance
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
            /// AppBar - Nested Column
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppBar1(
                    onProfilePressed: () async {
                      ///Clearing data while navigating to DashBoardScreen.
                      clearDataWhilePopping();
                      await Get.off(()=> DashBoardScreen());
                    },
                    onSettingsPressed: () {
                      Get.off(() => SavedResultsScreen());
                    },
                  ),
                ),
                Text(
                  "All Results",
                  style: TextStyle(
                      color: themeColors.blackColor.value,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          color: themeColors.tertiaryColor.value,
                          offset: Offset(1, -1),
                          blurRadius: 2,
                        )
                      ]),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Container(
              height: 1,
              width: Get.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: themeColors.lightGreyColor.value.withOpacity(0.9),
                    offset: Offset(1, 0),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ]
              ),
            ),

            /// Body - Nested Column
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: variables.allResults.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> resultMap =
                        variables.allResults[index];

                    ///Wrapping ListView's return Item with disassemble
                    return Dismissible(
                      key: Key(resultMap.toString()),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: themeColors.primaryColor.value,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.delete,
                          color: themeColors.whiteColor.value,
                        ),
                      ),
                      onDismissed: (direction) {
                        ///Removing List from allResults map
                        variables.allResults.removeAt(index);
                        ///Deleting List from sp
                        sp_deleters().spValueDelete("resultList$index");
                        ///Showing Snack-bar
                        Get.snackbar("Deleted", "Result removed successfullt",
                        snackPosition: SnackPosition.BOTTOM,
                        );
                      },
                      ///ListView's return Item
                      child: Container(
                        height: 250,
                        width: Get.width,
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: themeColors.whiteColor.value,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: themeColors.tertiaryColor.value,
                                offset: const Offset(1, 3),
                                blurRadius: 3,
                                spreadRadius: 4,
                              ),
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ///Date Row
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  resultMap["date"],
                                  style: TextStyles.smallAccent(),
                                )
                              ],
                            ),

                            ///Gender Row
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: themeColors.tertiaryColor.value
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Gender",
                                      style: TextStyles.chartCategory()),
                                  Text(
                                    resultMap["selectedGender"],
                                    style: TextStyles.chartValue(),
                                  )
                                ],
                              ),
                            ),

                            ///Weight Row
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: themeColors.tertiaryColor.value
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Weight(kg)",
                                      style: TextStyles.chartCategory()),
                                  Text(
                                    resultMap["weightKg"],
                                    style: TextStyles.chartValue(),
                                  )
                                ],
                              ),
                            ),

                            ///Age Row
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: themeColors.tertiaryColor.value
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Age",
                                      style: TextStyles.chartCategory()),
                                  Text(
                                    resultMap["age"],
                                    style: TextStyles.chartValue(),
                                  )
                                ],
                              ),
                            ),

                            ///Height Row
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: themeColors.tertiaryColor.value
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Height",
                                      style: TextStyles.chartCategory()),
                                  Text(
                                    resultMap["height"],
                                    style: TextStyles.chartValue(),
                                  )
                                ],
                              ),
                            ),

                            ///BMI Row
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: themeColors.tertiaryColor.value
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("BMI",
                                      style: TextStyles.chartCategory()),
                                  Text(
                                    resultMap["bMI"],
                                    style: TextStyles.chartValue(),
                                  )
                                ],
                              ),
                            ),

                            /// Body type Row
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  color: themeColors.tertiaryColor.value
                                      .withOpacity(0.1)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("BodyType",
                                      style: TextStyles.chartCategory()),
                                  Text(
                                    resultMap["bodyType"],
                                    style: TextStyles.chartValue(),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///Backup working
// import 'package:bmi_calculator/shared/theme_colors.dart';
// import 'package:bmi_calculator/shared/theme_text_styles.dart';
// import 'package:bmi_calculator/shared/variables.dart';
// import 'package:bmi_calculator/views/dashboard_screen.dart';
// import 'package:bmi_calculator/widgets/custom_appbar.dart';
// import 'package:bmi_calculator/widgets/custom_buttons.dart';
// import 'package:bmi_calculator/widgets/spacers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../core/shared_Preferences_helper.dart';
//
// class SavedResultsScreen extends StatelessWidget {
//   SavedResultsScreen({super.key});
//
//   /// Theme colors instance
//   final RxThemeColors themeColors = Get.find<RxThemeColors>();
//
//   /// Variables instance
//   final RxVariables variables = Get.find<RxVariables>();
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: themeColors.backgroundColor.value,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             /// AppBar - Nested Column
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: AppBar1(
//                     onProfilePressed: () {
//                       Get.off(() => DashBoardScreen());
//                     },
//                     onSettingsPressed: () {
//                       Get.off(() => SavedResultsScreen());
//                     },
//                   ),
//                 ),
//                 Text(
//                   "All Results",
//                   style: TextStyle(
//                     color: themeColors.blackColor.value,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 30,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//             /// Body - Nested Column
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Obx(
//                       () => ListView.builder(
//                     itemCount: variables.allResults.length,
//                     itemBuilder: (context, index) {
//                       Map<String, dynamic> resultMap = variables.allResults[index];
//                       return Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: Dismissible(
//                           key: Key(resultMap.toString()), // Unique key for each item
//                           direction: DismissDirection.endToStart,
//                           background: Container(
//                             color: Colors.red,
//                             alignment: Alignment.centerRight,
//                             padding: EdgeInsets.only(right: 20.0),
//                             child: Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) {
//                             /// Remove the item from allResults when dismissed
//                             variables.allResults.removeAt(index);
//                             /// Remove from shared preferences
//                             sp_deleters().spValueDelete("resultList$index");
//                             /// Show a snackbar to confirm deletion
//                             Get.snackbar("Deleted", "Result removed successfully",
//                               snackPosition: SnackPosition.BOTTOM,
//                             );
//                           },
//                           child: Container(
//                             padding: EdgeInsets.all(16.0),
//                             height: 300,
//                             width: Get.width,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10.0),
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 2,
//                                   blurRadius: 5,
//                                   offset: Offset(0, 3), // changes position of shadow
//                                 ),
//                               ],
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text("Date: ${resultMap["date"]}"),
//                                 SizedBox(height: 8.0),
//                                 Text("Gender: ${resultMap["selectedGender"]}"),
//                                 SizedBox(height: 8.0),
//                                 Text("Weight: ${resultMap["weightKg"]} kg"),
//                                 SizedBox(height: 8.0),
//                                 Text("Age: ${resultMap["age"]} years"),
//                                 SizedBox(height: 8.0),
//                                 Text("Height: ${resultMap["height"]} meters"),
//                                 SizedBox(height: 8.0),
//                                 Text("BMI: ${resultMap["bMI"]}"),
//                                 SizedBox(height: 8.0),
//                                 Text("Body Type: ${resultMap["bodyType"]}"),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
