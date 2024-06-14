import 'package:bmi_calculator/shared/variables.dart';
import 'package:get/get.dart';

calculateBodyType(){
  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  ///For Male body type
  if(variables.selectedGender.value == "Male"){
    ///For Underweight
    if(variables.bMI.value <= variables.maleBodyBMIList[0]){
      variables.bodyType.value = variables.bodyStatusList[0];
      ///For Healthy
    }else if (variables.bMI.value > variables.maleBodyBMIList[0]
        && variables.bMI.value <= variables.maleBodyBMIList[1]){
      variables.bodyType.value = variables.bodyStatusList[1];
      ///For Overweight
    }else if(variables.bMI.value > variables.maleBodyBMIList[1]
        && variables.bMI.value <= variables.maleBodyBMIList[2]){
      variables.bodyType.value = variables.bodyStatusList[2];
      ///For Obese
    }else if(variables.bMI.value >= variables.maleBodyBMIList[2]){
      variables.bodyType.value = variables.bodyStatusList[3];
    }
  }
  ///For Female body type
  else if (variables.selectedGender.value == "Female"){
    ///For Underweight
    if(variables.bMI.value <= variables.femaleBodyBMIList[0]){
      variables.bodyType.value = variables.bodyStatusList[0];
      ///For Healthy
    }else if (variables.bMI.value > variables.femaleBodyBMIList[0]
        && variables.bMI.value <= variables.femaleBodyBMIList[1]){
      variables.bodyType.value = variables.bodyStatusList[1];
      ///For Overweight
    }else if(variables.bMI.value > variables.femaleBodyBMIList[1]
        && variables.bMI.value <= variables.femaleBodyBMIList[2]){
      variables.bodyType.value = variables.bodyStatusList[2];
      ///For Obese
    }else if(variables.bMI.value >= variables.femaleBodyBMIList[2]){
      variables.bodyType.value = variables.bodyStatusList[3];
    }
  }
  ///For Michael Jackson
  else if (variables.selectedGender.value == "Other"){
    ///For Underweight
    if(variables.bMI.value <= variables.otherBodyBMIList[0]){
      variables.bodyType.value = variables.bodyStatusList[0];
      ///For Healthy
    }else if (variables.bMI.value > variables.otherBodyBMIList[0]
        && variables.bMI.value <= variables.otherBodyBMIList[1]){
      variables.bodyType.value = variables.bodyStatusList[1];
      ///For Overweight
    }else if(variables.bMI.value > variables.otherBodyBMIList[1]
        && variables.bMI.value <= variables.otherBodyBMIList[2]){
      variables.bodyType.value = variables.bodyStatusList[2];
      ///For Obese
    }else if(variables.bMI.value >= variables.otherBodyBMIList[2]){
      variables.bodyType.value = variables.bodyStatusList[3];
    }
  }
}