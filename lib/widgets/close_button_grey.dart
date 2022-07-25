import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';

Widget closeButtonGrey(Object? returnal) {
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
        child: Icon(
          Icons.close_rounded,
          color: kBlack,
          size: 16.w,
        ),
      ));
}
