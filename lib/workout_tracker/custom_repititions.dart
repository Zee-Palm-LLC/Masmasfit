import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/colors.dart';

class CustomRepititions extends StatelessWidget {
  const CustomRepititions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: kBorderColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          SizedBox(width: 15.w),
          Icon(CupertinoIcons.chart_bar_square, color: kGrey1, size: 20.w),
          SizedBox(
            width: 10.w,
          ),
          Text('Custom Repititions',
              style: TextFonts().kRegular12.copyWith(color: kGrey1)),
          const Expanded(child: SizedBox()),
          Icon(Icons.navigate_next_rounded, color: kGrey1, size: 20.w),
          SizedBox(width: 15.w),
        ],
      ),
    );
  }
}
