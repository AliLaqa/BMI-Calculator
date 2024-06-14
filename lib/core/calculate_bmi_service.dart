import 'package:bmi_calculator/shared/variables.dart';
import 'package:bmi_calculator/views/result_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

calculateBMI() {
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  if (variables.selectedGender.isNotEmpty &&
      variables.formKey.value.currentState!.validate()) {
    if (kDebugMode) {
      print('Gender selected and Input is valid');
    }

    ///Proceed with functionality
    //Calculate BMI
    if (kDebugMode) {
      print("\nselectedGender: ${variables.selectedGender.value}, \n"
        "selectedWeightType : ${variables.selectedWeightType.value}, "
        "enterWeightTextController : ${variables.enterWeightTextController.value.text}, \n"
        "enterAgeTextController : ${variables.enterAgeTextController.value.text}, \n"
        "selectedHeightType : ${variables.selectedHeightType.value}, "
        "enterHeightTextController : ${variables.enterHeightTextController.value.text}\n\n");
    }

    //Storing Weight as Int
    variables.weightInt.value =
        double.parse(variables.enterWeightTextController.value.text.trim());
    //Storing Age as Int
    variables.ageInt.value =
        double.parse(variables.enterAgeTextController.value.text.trim());
    //Storing Height as Int
    variables.heightInt.value =
        double.parse(variables.enterHeightTextController.value.text.trim());

    ///Convert Gram to Kilogram (weight = weight / 1000;)
    if (variables.selectedWeightType.value == "Gram") {
      variables.weightInt.value = variables.weightInt.value / 1000;
      if (kDebugMode) {
        print("weightInt to Kg : ${variables.weightInt.value}");
      }
    }

    ///Convert cm to meter (height = height / 100;)
    if (variables.selectedHeightType.value == "cm") {
      variables.heightInt.value = variables.heightInt.value / 100;
      if (kDebugMode) {
        print("heightInt to meter : ${variables.heightInt.value}\n\n");
      }
    }

    ///Convert-Store meter to meter square(meter * 2)/(height * height)
    variables.heightMeterSqInt.value =
        variables.heightInt.value * variables.heightInt.value;
    if (kDebugMode) {
      print("heightMeterSqInt : ${variables.heightMeterSqInt.value}");
    }

    ///Store weight in kg
    variables.weightKgInt.value = variables.weightInt.value;
    if (kDebugMode) {
      print("weightKgInt : ${variables.weightKgInt.value}\n");
    }

    ///Calculate BMI (BMI = weight.kg / height.meterSq)
    variables.unformattedBMi.value =
        variables.weightKgInt.value / variables.heightMeterSqInt.value;

    ///Formatting BMI value to one decimal point
    variables.unformattedBMiString.value =
        variables.unformattedBMi.value.toStringAsFixed(1);

    ///Storing formatted BMI value
    variables.bMI.value = double.parse(variables.unformattedBMiString.value);
    if (kDebugMode) {
      print("bMi : ${variables.bMI.value}");
    }

    ///Navigate to ResultScreen
    Get.off(() => ResultScreen(selectedGender: variables.selectedGender.value));
  } else if (variables.selectedGender.isEmpty) {
    ///Empty Gender checker
    Get.snackbar("Gender not selected", "Please select your gender");
    if (kDebugMode) {
      print("Gender not selected, selectedGender : ${variables.selectedGender.value}");
    }
  }
}
