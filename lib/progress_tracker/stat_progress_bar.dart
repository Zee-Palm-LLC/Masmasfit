// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class StatProgressBar extends StatelessWidget {
  final String stat;
  final double statPercentage;
  final Color color;
  const StatProgressBar({
    Key? key,
    required this.stat,
    required this.statPercentage,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          stat,
          style: TextFonts().kRegular14,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 20.h,
          width: 315.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${statPercentage.round()}%',
                style: TextFonts().kRegular12.copyWith(color: kGrey1),
              ),
              SizedBox(
                width: 243.w,
                height: 10.h,
                child: Row(
                  children: [
                    Container(
                      width: (statPercentage / 100) * 243.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(99.r),
                              bottomLeft: Radius.circular(99.r))),
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          gradient: kBlueLinear,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(99.r),
                              bottomRight: Radius.circular(99.r))),
                    )),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '${100 - statPercentage.round()}%',
                style: TextFonts().kRegular12.copyWith(color: kGrey1),
              ),
            ],
          ),
        )
      ],
    );
  }
}
