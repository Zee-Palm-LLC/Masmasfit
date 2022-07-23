// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:masmas_fit/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color? fillColor;
  final LinearGradient? gradient;
  final VoidCallback onPressed;
  final Widget child;
  final double height;
  final double width;
  final double? borderRadius;
  final Color? borderColor;

  const CustomElevatedButton({
    Key? key,
    this.fillColor,
    this.gradient,
    required this.onPressed,
    required this.child,
    required this.height,
    required this.width,
    this.borderRadius,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: gradient,
            color: fillColor,
            border: Border.all(
              color: borderColor ?? kBorderColor,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 99.r)),
        child: Center(child: child),
      ),
    );
  }
}
