import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class IdealSleepCard extends StatelessWidget {
  final Duration idealSleep = const Duration(hours: 8, minutes: 30);
  const IdealSleepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140.h,
      width: 315.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: kBlue2.withOpacity(0.2),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 23.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ideal Hours for Sleep',
                  style: TextFonts().kRegular12,
                ),
                SizedBox(
                  height: 5.h,
                ),
                GradientText(
                  '${idealSleep.inHours.toString()}hours ${(idealSleep.inMinutes % 60).toString()}minutes',
                  style: TextFonts().kMedium14,
                  gradient: kBlueLinear,
                ),
                SizedBox(
                  height: 15.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 95.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        gradient: kBlueLinear,
                        borderRadius: BorderRadius.circular(50.r)),
                    alignment: Alignment.center,
                    child: Text(
                      'Learn More',
                      style: TextFonts().kSemiBold10.copyWith(color: kWhite),
                    ),
                  ),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          SvgPicture.asset(Assets().kIdealSleep),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
