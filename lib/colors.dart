import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//color
Color kBlue1 = const Color(0xFF92A3FD);
Color kBlue2 = const Color(0xFF9DCEFF);
Color kBlue3 = const Color(0xFF9dceff);
Color kBlue4 = const Color(0xFF93a8fe);
Color kPurple1 = const Color(0xFFC58BF2);
Color kPurple2 = const Color(0xFFEEA4CE);
Color kPurple3 = const Color(0xFFC58BF2);
Color kPurple4 = const Color(0xFFB4C0FE);
Color kPurple5 = const Color(0xFF92A3fd);
Color kPurple6 = const Color(0xFFCC8Fed);
Color kGrey1 = const Color(0xFF7B6f72);
Color kGrey2 = const Color(0xFFada4a5);
Color kGrey3 = const Color(0xffdddada);
Color kGrey4 = const Color(0xFFc4c4c4);
Color kWhite = const Color(0xFFFFFFFF);
Color kBlack = const Color(0xFF1d1617);
Color kBorderColor = const Color(0xfff7f8f8);
Color kSuccess = const Color(0xff42d742);
Color kWarning = const Color(0xffffd600);
Color kDanger = const Color(0xFFFF0000);
Color kCardShadowColor = const Color(0xff1d1617);
Color kBlueShadowColor = const Color(0xff95adfe);
Color kPurpleShadowColor = const Color(0xffc586f2);

//gradients
LinearGradient kGraphLinear = LinearGradient(
    colors: [kBlue4, kWhite],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
LinearGradient kGraphLinearTransluscent = LinearGradient(
    colors: [kBlue4, kWhite.withOpacity(0.1)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter);
LinearGradient kWhiteLinear = LinearGradient(
  colors: [kWhite, kWhite],
);
LinearGradient kBlueLinear = LinearGradient(
  colors: [kBlue1, kBlue2],
);
LinearGradient kPurpleLinear = LinearGradient(
  colors: [kPurple1, kPurple2],
);
LinearGradient kCaloriesLinear = LinearGradient(
  colors: [kPurple3, kPurple4],
);
LinearGradient kPogressBarLinear = LinearGradient(
  colors: [kPurple3, kPurple5],
);
LinearGradient kWaterIntakeLinear = LinearGradient(
  colors: [kPurple6, kBlue3],
);
LinearGradient kMoolitAsteroid = const LinearGradient(
    colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)]);
LinearGradient kCitrusPeel = const LinearGradient(
  colors: [Color(0xFFfdc830), Color(0xfff37335)],
);

//shadow
BoxShadow kCardShadow = BoxShadow(
    color: kCardShadowColor.withOpacity(0.07),
    blurRadius: 40.r,
    offset: const Offset(0, 1));
BoxShadow kBlueShadow = BoxShadow(
  blurRadius: 22.r,
  offset: const Offset(0, 1),
  color: kBlueShadowColor.withOpacity(0.3),
);
BoxShadow kPurpleShadow = BoxShadow(
    color: kPurpleShadowColor.withOpacity(0.3),
    offset: const Offset(0, 1),
    blurRadius: 22.r);

//radius
double radiusTextFormField = 14.r;

//const functions
String getMonthName(int monthNumber) {
  return months[monthNumber - 1];
}

List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'June',
  'July',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec'
];

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
