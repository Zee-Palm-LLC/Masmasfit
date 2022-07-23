// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/bmi_pie_chart.dart';
import 'package:masmas_fit/text_fonts.dart';

class BMICard extends StatefulWidget {
  final double bmi;
  const BMICard({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  @override
  State<BMICard> createState() => _BMICardState();
}

class _BMICardState extends State<BMICard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 146.h,
      decoration: BoxDecoration(
          gradient: kBlueLinear, borderRadius: BorderRadius.circular(22.r)),
      child: Stack(children: [
        SizedBox(
          width: 315.w,
          height: 146.h,
          child: SvgPicture.asset(
            Assets().kBMIBannnerBack,
            fit: BoxFit.fitWidth,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.0.w, top: 20.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'BMI (Body Mass Index)',
                    style: TextFonts().kSemiBold14.copyWith(color: kWhite),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'You have a normal weight',
                    style: TextFonts().kRegular12.copyWith(color: kWhite),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  GradientButton(
                      gradient: kPurpleLinear,
                      increaseWidthBy: 20.w,
                      elevation: 0,
                      child: Text(
                        'View More',
                        style: TextFonts().kSemiBold10.copyWith(color: kWhite),
                      ),
                      callback: () {})
                ],
              ),
              BMIPieChart(bmi: widget.bmi)
            ],
          ),
        )
      ]),
    );
  }
}
