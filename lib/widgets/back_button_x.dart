import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';

Widget backButtonX(Object? returnal) {
  return InkWell(
      onTap: () {
        Get.back(result: returnal);
      },
      child: Icon(
        Icons.clear_rounded,
        color: kBlue3,
        size: 50.w,
      ));
}
