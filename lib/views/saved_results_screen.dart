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
                    onProfilePressed: () {
                      Get.off(() => DashBoardScreen());
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
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            /// Body - Nested Column
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(
                      () => ListView.builder(
                    itemCount: variables.allResults.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> resultMap = variables.allResults[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Dismissible(
                          key: Key(resultMap.toString()), // Unique key for each item
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 20.0),
                            child: Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) {
                            /// Remove the item from allResults when dismissed
                            variables.allResults.removeAt(index);
                            /// Remove from shared preferences
                            sp_deleters().spValueDelete("resultList$index");
                            /// Show a snackbar to confirm deletion
                            Get.snackbar("Deleted", "Result removed successfully",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Date: ${resultMap["date"]}"),
                                SizedBox(height: 8.0),
                                Text("Gender: ${resultMap["selectedGender"]}"),
                                SizedBox(height: 8.0),
                                Text("Weight: ${resultMap["weightKg"]} kg"),
                                SizedBox(height: 8.0),
                                Text("Age: ${resultMap["age"]} years"),
                                SizedBox(height: 8.0),
                                Text("Height: ${resultMap["height"]} meters"),
                                SizedBox(height: 8.0),
                                Text("BMI: ${resultMap["bMI"]}"),
                                SizedBox(height: 8.0),
                                Text("Body Type: ${resultMap["bodyType"]}"),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
