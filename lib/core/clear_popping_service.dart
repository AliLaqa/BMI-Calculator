import 'package:bmi_calculator/shared/variables.dart';
import 'package:get/get.dart';

clearDataWhilePopping(){
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();
  ///Clearing selected Gender
  variables.selectedGender.value = "";
  ///Clearing weight controller and it's related variables
  variables.enterWeightTextController.value.clear();
  variables.weightInt.value = 0.0;
  variables.weightKgInt.value = 0.0;
  ///Clearing Age Controller
  variables.enterAgeTextController.value.clear();
  variables.ageInt.value = 0.0;
  ///Clearing Height Controller
  variables.enterHeightTextController.value.clear();
  variables.heightInt.value = 0.0;
  variables.heightMeterSqInt.value = 0.0;
  ///Clearing BMI related Variables
  variables.bMI.value = 0.0;
  variables.unformattedBMi.value = 0.0;
  variables.unformattedBMiString.value = "";
}