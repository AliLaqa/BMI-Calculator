import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBar1 extends StatelessWidget {
  final VoidCallback onProfilePressed;
  final VoidCallback onSettingsPressed;

  const AppBar1(
      {super.key,
      required this.onProfilePressed,
      required this.onSettingsPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              onProfilePressed();
            },
            child: Container(
              height: 40,
              width: Get.width * 0.1,
              child: Image.asset("assets/icons/carbon_user_profile.png"),
            ),
          ),

          ///Logo
          Container(
              width: Get.width * 0.55,
              child: Image.asset(
                "assets/icons/logo_no_bg_cropped.png",
                fit: BoxFit.contain,
                alignment: Alignment.center,
                repeat: ImageRepeat.noRepeat,
              )),

          TextButton(
            onPressed: () {
              onSettingsPressed();
            },
            child: Container(
              height: 40,
              width: Get.width * 0.1,
              child: Image.asset("assets/icons/oui_advanced_settings.png"),
            ),
          )
        ],
      ),
    );
  }
}
