import 'package:bmi_calculator/shared/theme_colors.dart';
import 'package:bmi_calculator/shared/theme_text_styles.dart';
import 'package:bmi_calculator/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomFormRow extends StatelessWidget {
  final String textHint;
  final RxString dropdownValue;
  final List<String> dropdownItems;
  final ValueChanged<String?> onDropdownChanged;
  final TextEditingController textController;
  final String emptyValueMessage;
  final String wrongValueMessage;

  CustomFormRow({super.key,
    required this.textHint,
    required this.dropdownValue,
    required this.dropdownItems,
    required this.onDropdownChanged,
    required this.textController,
    required this.emptyValueMessage,
    required this.wrongValueMessage,
  });

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // TextFormField
        Expanded(
          flex: 5,
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: themeColors.whiteColor.value,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: TextFormField(
              controller: textController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                hintText: textHint,
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust padding if necessary
              ),
              /// validator
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return emptyValueMessage;
                }
                final doubleValue = double.tryParse(value);
                if (doubleValue == null) {
                  return wrongValueMessage;
                }
                return null;
              },
            ),
          ),
        ),
        const SizedBox(width: 16.0), // Space between TextFormField and DropdownButton
        /// DropdownButton
        Expanded(
          flex: 3,
          child: Container(
            height: 45,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              color: themeColors.whiteColor.value,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: DropdownButtonHideUnderline(
              child: Obx(() {
                return DropdownButton<String>(
                  padding: const EdgeInsets.all(6),
                  value: dropdownValue.value , style: TextStyles.smallAccent(),
                  onChanged: onDropdownChanged,
                  isExpanded: true,
                  items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyles.smallAccent(),),
                    );
                  }).toList(),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}


class AgeFormField extends StatelessWidget {
  final String textHint;
  final TextEditingController textController;
  final String emptyValueMessage;
  final String wrongValueMessage;

   AgeFormField({super.key,
     required this.textHint,
     required this.textController,
     required this.emptyValueMessage,
     required this.wrongValueMessage,});

  ///Theme colors instance
  final RxThemeColors themeColors = Get.find<RxThemeColors>();

  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: themeColors.whiteColor.value,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          hintText: textHint,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust padding if necessary
        ),
        /// validator
        validator: (value) {
          if (value == null || value.isEmpty) {
            return emptyValueMessage;
          }
          final doubleValue = double.tryParse(value);
          if (doubleValue == null) {
            return wrongValueMessage;
          }
          return null;
        },
      ),
    );
  }
}


///Backup before Ghat GPT GetX form validation
//import 'package:bmi_calculator/shared/theme_colors.dart';
// import 'package:bmi_calculator/shared/theme_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// class CustomFormRow extends StatelessWidget {
//   final String textHint;
//   final RxString dropdownValue;
//   final List<String> dropdownItems;
//   final ValueChanged<String?> onDropdownChanged;
//   final TextEditingController textController;
//   final String emptyValueMessage;
//   final String wrongValueMessage;
//
//   CustomFormRow({
//     required this.textHint,
//     required this.dropdownValue,
//     required this.dropdownItems,
//     required this.onDropdownChanged,
//     required this.textController,
//     required this.emptyValueMessage,
//     required this.wrongValueMessage,
//   });
//
//   ///Theme colors instance
//   final RxThemeColors themeColors = Get.find<RxThemeColors>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         // TextFormField
//         Expanded(
//           flex: 5,
//           child: Container(
//             height: 45,
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             decoration: BoxDecoration(
//               color: themeColors.whiteColor.value,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: TextFormField(
//               controller: textController,
//               keyboardType: TextInputType.number,
//               textInputAction: TextInputAction.done,
//               decoration: InputDecoration(
//                 hintText: textHint,
//                 border: InputBorder.none,
//                 contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust padding if necessary
//               ),
//               ///To check for Validation
//               onChanged: (value){
//
//               },
//               /// validator
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return emptyValueMessage;
//                 }
//                 final doubleValue = double.tryParse(value);
//                 if (doubleValue == null) {
//                   return wrongValueMessage;
//                 }
//                 return null;
//               },
//             ),
//           ),
//         ),
//         SizedBox(width: 16.0), // Space between TextFormField and DropdownButton
//         /// DropdownButton
//         Expanded(
//           flex: 3,
//           child: Container(
//             height: 45,
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             decoration: BoxDecoration(
//               color: themeColors.whiteColor.value,
//               borderRadius: BorderRadius.circular(20.0),
//             ),
//             child: DropdownButtonHideUnderline(
//               child: Obx(() {
//                 return DropdownButton<String>(
//                   padding: const EdgeInsets.all(6),
//                   value: dropdownValue.value , style: TextStyles.smallAccent(),
//                   onChanged: onDropdownChanged,
//                   isExpanded: true,
//                   items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value,style: TextStyles.smallAccent(),),
//                     );
//                   }).toList(),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
// class AgeFormField extends StatelessWidget {
//   final String textHint;
//   final TextEditingController textController;
//   final String emptyValueMessage;
//   final String wrongValueMessage;
//
//    AgeFormField({super.key, required this.textHint, required this.textController, required this.emptyValueMessage, required this.wrongValueMessage});
//
//   ///Theme colors instance
//   final RxThemeColors themeColors = Get.find<RxThemeColors>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 45,
//       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//       decoration: BoxDecoration(
//         color: themeColors.whiteColor.value,
//         borderRadius: BorderRadius.circular(20.0),
//       ),
//       child: TextFormField(
//         controller: textController,
//         keyboardType: TextInputType.number,
//         textInputAction: TextInputAction.done,
//         inputFormatters: <TextInputFormatter>[
//           FilteringTextInputFormatter.digitsOnly
//         ],
//         decoration: InputDecoration(
//           hintText: textHint,
//           border: InputBorder.none,
//           contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0), // Adjust padding if necessary
//         ),
//         ///To check for Validation
//         onChanged: (value){
//
//         },
//         /// validator
//         validator: (value) {
//           if (value == null || value.isEmpty) {
//             return emptyValueMessage;
//           }
//           final doubleValue = double.tryParse(value);
//           if (doubleValue == null) {
//             return wrongValueMessage;
//           }
//           return null;
//         },
//       ),
//     );
//   }
// }