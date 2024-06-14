import 'package:get/get.dart';
import 'package:flutter/material.dart';

class RxThemeColors extends GetxController {
  Rx<Color> primaryColor = const Color.fromARGB(255, 211, 32, 32).obs; //Close to Light Red
  Rx<Color> secondaryColor = const Color.fromARGB(255, 211, 213, 220).obs; //Close to Dark Gray
  Rx<Color> tertiaryColor = const Color.fromARGB(255, 97, 97, 97).obs; //Close to Dim Gray
  Rx<Color> accentColor = const Color.fromARGB(255, 47, 47, 47).obs; //Close to Very Dark Gray
  Rx<Color> backgroundColor = const Color.fromARGB(255, 237, 237, 237).obs; //Close to White Smoke
  Rx<Color> blackColor = const Color.fromARGB(255, 0, 0, 0).obs; //Black
  Rx<Color> whiteColor = const Color.fromARGB(255, 255, 255, 255).obs; //White
}