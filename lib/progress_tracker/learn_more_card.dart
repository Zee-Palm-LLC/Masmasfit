import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class LearnMoreCard extends StatelessWidget {
  const LearnMoreCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 137.h,
      decoration: BoxDecoration(
        color: kBlue2.withOpacity(0.2),
        borderRadius: BorderRadius.circular(22.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 23.h),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Track Your Progress Each',
                  style: TextFonts().kMedium12,
                ),
                Row(
                  children: [
                    Text(
                      'Month With ',
                      style: TextFonts().kMedium12,
                    ),
                    GradientText(
                      'Photo',
                      style: TextFonts().kSemiBold12,
                      gradient: kBlueLinear,
                    ),
                  ],
                ),
                GradientButton(
                    elevation: 0,
                    callback: () {},
                    gradient: kBlueLinear,
                    child: Text(
                      'Learn More',
                      style: TextFonts().kSemiBold10.copyWith(color: kWhite),
                    )),
              ],
            ),
            const Expanded(child: SizedBox()),
            SvgPicture.asset(Assets().kProgressPhotoArt)
          ],
        ),
      ),
    );
  }
}
