// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/nav_bar.dart';
import 'package:masmas_fit/sign_up_and_login.dart/register_page.dart';
import 'package:masmas_fit/workout_tracker/workout_schedule.dart';

class CustomFloatingProgressButton extends StatelessWidget {
  final LinearGradient? gradient;
  final VoidCallback onPressed;
  final Widget child;
  final double? size;
  final double value;
  const CustomFloatingProgressButton({
    Key? key,
    this.size,
    required this.value,
    required this.gradient,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        Get.to(() => const MyNavbar(), transition: Transition.rightToLeft);
      },
      child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          onPressed: onPressed,
          child: Stack(
            children: [
              GradientButton(
                elevation: 0,
                shape: const CircleBorder(),
                increaseHeightBy: size ?? 10.w,
                callback: () {},
                gradient: gradient ?? kBlueLinear,
                child: child,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50.w,
                  width: 50.w,
                  child: CircularProgressIndicator(
                    value: value,
                    strokeWidth: 2.w,
                    color: kBlue3,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
