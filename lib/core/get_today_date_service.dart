import 'package:bmi_calculator/shared/variables.dart';
import 'package:get/get.dart';

String getTodayDate() {

  ///Variables instance
  final RxVariables variables = Get.find<RxVariables>();

  // Get current date
  DateTime now = DateTime.now();

  // Format the date
  variables.formattedDate.value = "${_getWeekdayName(now.weekday)} ${now.day} ${_getMonthName(now.month)} ${now.year}";
  print("formattedDate : ${variables.formattedDate.value}");
  return variables.formattedDate.value;
}

String _getWeekdayName(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return "Monday";
    case DateTime.tuesday:
      return "Tuesday";
    case DateTime.wednesday:
      return "Wednesday";
    case DateTime.thursday:
      return "Thursday";
    case DateTime.friday:
      return "Friday";
    case DateTime.saturday:
      return "Saturday";
    case DateTime.sunday:
      return "Sunday";
    default:
      return "";
  }
}

String _getMonthName(int month) {
  switch (month) {
    case DateTime.january:
      return "January";
    case DateTime.february:
      return "February";
    case DateTime.march:
      return "March";
    case DateTime.april:
      return "April";
    case DateTime.may:
      return "May";
    case DateTime.june:
      return "June";
    case DateTime.july:
      return "July";
    case DateTime.august:
      return "August";
    case DateTime.september:
      return "September";
    case DateTime.october:
      return "October";
    case DateTime.november:
      return "November";
    case DateTime.december:
      return "December";
    default:
      return "";
  }
}
