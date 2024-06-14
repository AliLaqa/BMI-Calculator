import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RxVariables extends GetxController {
  ///For Gender Selection
  var genderList = <String>["Male", "Female", "Other"].obs;
  var selectedGender = "".obs;

  ///For Weight Dropdown Button Menu
  var kg = "Kg";
  var gram = "Gram";
  var selectedWeightType = "Kg".obs;

  ///For Height Dropdown Button Menu
  var cm = "cm".obs;
  var meter = "meter".obs;
  var selectedHeightType = "cm".obs;

  ///For DashBoard Text Form Fields
  final formKey = GlobalKey<FormState>().obs;
  var enterWeightTextController = TextEditingController().obs;
  var enterAgeTextController = TextEditingController().obs;
  var enterHeightTextController = TextEditingController().obs;

  ///For Result Screen Indicator Progress
  var indicatorProgress = 0.0.obs;
  List bodyStatusList =
      <String>["Underweight", "Healthy", "Overweight", "Obese"].obs;
  var bodyType = "".obs;

  ///For BMI Chart
  List maleBodyBMIList = <double>[18.4, 25.5, 32,].obs;
  List femaleBodyBMIList = <double>[18.4, 24.5, 32,].obs;
  List otherBodyBMIList = <double>[18.4, 25.5, 32,].obs;
  var lessThan = "".obs;
  var healthy = "".obs;
  var overWeight = "".obs;
  var obese = "".obs;

  ///For BMI Calculation
  var weightInt = 0.0.obs;
  var ageInt = 0.0.obs;
  var heightInt = 0.0.obs;

  ///entered values after converting:(gram to kg),(cm -> meter to meter-sq)
  var weightKgInt = 0.0.obs;
  var heightMeterSqInt = 0.0.obs;

  ///For BMI value after calculation
  var unformattedBMi = 0.0.obs;
  var unformattedBMiString = "".obs;
  var bMI = 0.0.obs; //for formatted to one decimal point

  ///For Saving/Getting Result in Shared Preferences
  var formattedDate = "".obs;
  var resultList = <String>[].obs; //for adding result and saving in sp
  var currentIndex = 0.obs; //for result saving index count
  var allResults = <Map<String,dynamic>>[].obs; // for retrieving results from sp

}
