import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [kCardShadow],
          color: kWhite,
          borderRadius: BorderRadius.circular(20.r)),
      width: 150.w,
      height: 150.w,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sleep',
              style: TextFonts().kMedium12,
            ),
            
            GradientText(
              '7hr 56m',
              style: TextFonts().kSemiBold14,
              gradient: kBlueLinear,
            ),
            SvgPicture.asset(
              Assets().kSleepGraphMain,
              fit: BoxFit.fitWidth,
            )
          ],
        ),
      ),
    );
  }
}
