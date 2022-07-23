import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/notification_page.dart';

Widget NotificationButtonGrey(Object? returnal) {
  return InkWell(
      onTap: () {
        Get.to(() => NotificationPage(), transition: Transition.cupertino);
      },
      child: Container(
        width: 32.w,
        height: 32.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBorderColor, borderRadius: BorderRadius.circular(8.r)),
        child: SvgPicture.asset(
          Assets().kNotificationsNew,
          fit: BoxFit.contain,
        ),
      ));
}
