import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class LastNightSleepCard extends StatelessWidget {
  const LastNightSleepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 148.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.w),
        gradient: kBlueLinear,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text(
              "Last Night's Sleep",
              style: TextFonts().kMedium14.copyWith(color: kWhite),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0.w),
            child: Text('8h 20m',
                style: TextFonts().kMedium16.copyWith(color: kWhite)),
          ),
          SizedBox(
            height: 78.h,
            width: 315.w,
            child: SvgPicture.asset(
              Assets().kSleepGraph2,
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
