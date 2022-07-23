// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:timelines/timelines.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class IllustratedSteps extends StatefulWidget {
  final List<String> steps;
  const IllustratedSteps({
    Key? key,
    required this.steps,
  }) : super(key: key);

  @override
  State<IllustratedSteps> createState() => _IllustratedStepsState();
}

class _IllustratedStepsState extends State<IllustratedSteps> {
  @override
  Widget build(BuildContext context) {
    return FixedTimeline.tileBuilder(
      builder: TimelineTileBuilder.connected(
          nodePositionBuilder: (context, index) {
            return 0.17;
          },
          itemCount: widget.steps.length,
          contentsAlign: ContentsAlign.basic,
          oppositeContentsBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 30.0.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GradientText(
                  index < 10 ? '0${index + 1}' : '${index + 1}',
                  style: TextFonts().kRegular14,
                  gradient: kPurpleLinear,
                ),
              ),
            );
          },
          contentsBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: 15.w, top: 30.h),
              child: Container(
                width: 253.w,
                constraints: BoxConstraints(
                  minHeight: 44.w,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Step ${index + 1}'),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      widget.steps[index],
                      style: TextFonts().kRegular12.copyWith(color: kGrey1),
                    )
                  ],
                ),
              ),
            );
          },
          connectorBuilder: (context, index, _) {
            //padding useless
            return Container(
              width: 2.w,
              decoration: BoxDecoration(gradient: kPurpleLinear),
            );
          },
          indicatorBuilder: (context, index) {
            return Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, gradient: kPurpleLinear),
              child: Center(
                child: Container(
                  width: 16.w,
                  height: 16.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kWhite,
                  ),
                  child: Center(
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, gradient: kPurpleLinear),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
