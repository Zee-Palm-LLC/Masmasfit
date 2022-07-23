import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class TodayTargetCard extends StatelessWidget {
  const TodayTargetCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 142.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: kBlue2.withOpacity(0.3)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 26.h,
              width: 275.w,
              child: Row(
                children: [
                  Text(
                    "Today's Target",
                    style: TextFonts().kSemiBold14,
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                        gradient: kBlueLinear,
                        borderRadius: BorderRadius.circular(8.r)),
                    child: Center(
                        child: Icon(
                      Icons.add_rounded,
                      color: kWhite,
                      size: 14.w,
                    )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                Container(
                  width: 130.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(12.r)),
                  child: Row(children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    SizedBox(
                        height: 26.w,
                        width: 26.w,
                        child: SvgPicture.asset(
                          Assets().kWaterGlass,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          '8L',
                          style: TextFonts().kMedium14,
                          gradient: kBlueLinear,
                        ),
                        Text(
                          'Water Intake',
                          style: TextFonts().kRegular12.copyWith(color: kGrey1),
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  width: 130.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: kWhite, borderRadius: BorderRadius.circular(12.r)),
                  child: Row(children: [
                    SizedBox(
                      width: 8.w,
                    ),
                    SizedBox(
                        height: 26.w,
                        width: 26.w,
                        child: SvgPicture.asset(
                          Assets().kBootsSteps,
                          fit: BoxFit.contain,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          '2400',
                          style: TextFonts().kMedium14,
                          gradient: kBlueLinear,
                        ),
                        Text(
                          'Foot Steps',
                          style: TextFonts().kRegular12.copyWith(color: kGrey1),
                        )
                      ],
                    )
                  ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
