import 'package:bmi_calculator/core/shared_Preferences_helper.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';


saveResult()async{
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  ///Adding All values to List
  variables.resultList.addAll([
    variables.formattedDate.value,
    variables.selectedGender.value,
    variables.weightKgInt.value.toStringAsFixed(1),
    variables.ageInt.value.toString(),
    variables.heightInt.value.toStringAsFixed(1),
    variables.bMI.value.toString(),
    variables.bodyType.value,
  ]);

  /// Saving the current index from shared preferences
  variables.currentIndex.value = await sp_getters().spIntGetter("resultIndex") ?? 0;

  ///Saving variables.resultList to sp
  if(variables.resultList.isNotEmpty){
    await sp_setters().spStringListSetter("resultList${variables.currentIndex.value}", variables.resultList);
    if (kDebugMode) {
      print("saved to sp, resultList${variables.currentIndex.value} : ${variables.resultList}");
    }

    /// Incrementing the index and save it back to shared preferences
    variables.currentIndex.value++;
    await sp_setters().spIntSetter("resultIndex", variables.currentIndex.value);
  }

  ///Handling error saving
  else if (variables.resultList.isEmpty){
    Get.snackbar("Error saving", "Please try later");
    if (kDebugMode) {
      print("List is empty, resultList : ${variables.resultList} ");
    }}

  /// Clear the resultList after saving
  variables.resultList.clear();
}
