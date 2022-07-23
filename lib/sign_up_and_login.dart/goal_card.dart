// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class GoalCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;
  final bool active;
  const GoalCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Container(
        height: active ? 478.h : 478.h - 100.h,
        width: 275.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.r),
            gradient: kBlueLinear,
            boxShadow: [kPurpleShadow]),
        child: active
            ? Column(
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  SvgPicture.asset(imagePath),
                  Text(
                    title,
                    style: TextFonts().kSemiBold14.copyWith(color: kWhite),
                  ),
                  SizedBox(
                      width: 50.w,
                      child: Divider(
                        color: kWhite,
                        thickness: 1.w,
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      description,
                      style: TextFonts().kRegular12.copyWith(color: kWhite),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
