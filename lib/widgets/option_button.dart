import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';

Widget optionButton(Object? returnal, VoidCallback onTap) {
  return InkWell(
      onTap: onTap,
      child: Container(
          width: 32.w,
          height: 32.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: kBorderColor, borderRadius: BorderRadius.circular(8.r)),
          child: SvgPicture.asset(Assets().kOptionTwoDot)));
}
