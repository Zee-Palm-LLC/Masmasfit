// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_schedule.dart';
import 'package:masmas_fit/text_fonts.dart';

class NutirionProgressBar extends StatelessWidget {
  final NutitionStat nutritiionStat;
  const NutirionProgressBar({
    Key? key,
    required this.nutritiionStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 63.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: kWhite,
          boxShadow: [kCardShadow]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 285.w,
            height: 20.h,
            child: Row(
              children: [
                Text(
                  nutritiionStat.name,
                  style: TextFonts().kMedium12,
                ),
                SizedBox(
                  width: 5.w,
                ),
                SvgPicture.asset(nutritiionStat.nutrientIcon),
                const Expanded(child: SizedBox()),
                Text(
                  '${nutritiionStat.amountDone}${nutritiionStat.unit}',
                  style: TextFonts().kRegular10.copyWith(color: kGrey1),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            width: 285.w,
            height: 10.h,
            child: Row(
              children: [
                Container(
                  width: (nutritiionStat.amountDone /
                          nutritiionStat.amountRequired) *
                      285.w,
                  decoration: BoxDecoration(
                      gradient: kPogressBarLinear,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(99.r),
                          bottomLeft: Radius.circular(99.r))),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(99.r),
                            bottomRight: Radius.circular(99.r))),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
