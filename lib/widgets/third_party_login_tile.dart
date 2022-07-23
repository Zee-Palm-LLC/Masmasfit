import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/colors.dart';

Widget thirdPartLoginTile({
  required VoidCallback onTap,
  required String iconPath,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50.w,
      width: 50.w,
      decoration: BoxDecoration(
          border: Border.all(color: kGrey3, width: 0.8.w),
          borderRadius: BorderRadius.circular(radiusTextFormField)),
      child: Center(
        child: SvgPicture.asset(
          iconPath,
          width: 20.w,
          height: 20.w,
        ),
      ),
    ),
  );
}
