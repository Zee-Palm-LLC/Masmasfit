import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';

Widget backButtonGrey(Object? returnal) {
  return InkWell(
      onTap: () {
        Get.back(result: returnal);
      },
      child: Container(
        width: 32.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBorderColor, borderRadius: BorderRadius.circular(8.r)),
        child: Icon(Icons.navigate_before_rounded, color: kBlack),
      ));
}
