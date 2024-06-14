import 'package:bmi_calculator/core/shared_Preferences_helper.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

getResults() async {
  /// Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  /// Get the current index from shared preferences
  variables.currentIndex.value = await sp_getters().spIntGetter("resultIndex") ?? 0;

  /// Clear the previous results
  variables.allResults.clear();

  /// Loop through all saved results
  for (int i = 0; i < variables.currentIndex.value; i++) {
    List<String>? resultList = await sp_getters().spStringListGetter("resultList$i");

    /// Check if resultList is not null and not empty
    if (resultList != null && resultList.isNotEmpty) {
      /// Map the current resultList to a structured map
      Map<String, dynamic> resultMap = {
        "date": resultList[0],
        "selectedGender": resultList[1],
        "weightKg": resultList[2],
        "age": resultList[3],
        "height": resultList[4],
        "bMI": resultList[5],
        "bodyType": resultList[6],
      };

      /// Add the result map to allResults
      variables.allResults.add(resultMap);
    }
  }

  /// After looping through all saved results, clear resultList
  variables.resultList.clear();

  /// Handle any error while retrieving the results
  if (variables.allResults.isEmpty) {
    Get.snackbar("Error retrieving results", "No saved results found");
    if (kDebugMode) {
      print("No saved results found, allResults: ${variables.allResults}");
    }
  }
}
