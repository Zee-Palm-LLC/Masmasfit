// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:timelines/timelines.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class WaterIntakeCard extends StatefulWidget {
  const WaterIntakeCard({Key? key}) : super(key: key);

  @override
  State<WaterIntakeCard> createState() => _WaterIntakeCardState();
}

class _WaterIntakeCardState extends State<WaterIntakeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 315.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: kWhite,
          boxShadow: [kCardShadow]),
      child: Padding(
        padding: EdgeInsets.only(left: 20.0.w, top: 20.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //progress bar
            SizedBox(
              width: 20.w,
              height: 275.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 175.h,
                    width: 20.h,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r))),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        gradient: kPurpleLinear,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.r),
                            bottomRight: Radius.circular(30.r))),
                  ))
                ],
              ),
            ),
            //Water Intake
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Text(
                    'Water Intake',
                    style: TextFonts().kMedium12,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: GradientText(
                    '4 Liters',
                    style: TextFonts().kSemiBold14,
                    gradient: kBlueLinear,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0.w),
                  child: Text(
                    'Real time updates',
                    style: TextFonts().kRegular10.copyWith(color: kGrey1),
                  ),
                ),
                IllustratedSteps(waterTimes: waterTimes)
              ],
            )
          ],
        ),
      ),
    );
  }

  List<WaterTimes> waterTimes = [
    WaterTimes(time: '6am - 8am', water: 600),
    WaterTimes(time: '8am - 10am', water: 300),
    WaterTimes(time: '10am - 12am', water: 0),
    WaterTimes(time: '12am - 1pm', water: 600),
    WaterTimes(time: '1pm - 3pm', water: 600),
  ];
}

class WaterTimes {
  final String time;
  final int water;
  WaterTimes({
    required this.time,
    required this.water,
  });
}

class IllustratedSteps extends StatefulWidget {
  final List<WaterTimes> waterTimes;
  const IllustratedSteps({
    Key? key,
    required this.waterTimes,
  }) : super(key: key);

  @override
  State<IllustratedSteps> createState() => _IllustratedStepsState();
}

class _IllustratedStepsState extends State<IllustratedSteps> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110.w,
      height: 219.h,
      child: FixedTimeline.tileBuilder(
        mainAxisSize: MainAxisSize.min,
        builder: TimelineTileBuilder.connected(
            nodePositionBuilder: (context, index) {
              return 0.1;
            },
            itemCount: widget.waterTimes.length,
            contentsAlign: ContentsAlign.basic,
            oppositeContentsBuilder: (context, index) {
              return const SizedBox();
            },
            contentsBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 10.w, top: 14.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(widget.waterTimes[index].time,
                        style: TextFonts().kRegular8),
                    SizedBox(
                      height: 3.h,
                    ),
                    GradientText(
                      '${widget.waterTimes[index].water}ml',
                      style: TextFonts().kMedium8.copyWith(color: kGrey1),
                      gradient: kPurpleLinear,
                    )
                  ],
                ),
              );
            },
            connectorBuilder: (context, index, _) {
              //padding useless
              return Container(
                width: 0.5.w,
                decoration: BoxDecoration(gradient: kPurpleLinear),
              );
            },
            indicatorBuilder: (context, index) {
              return Container(
                width: 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, gradient: kPurpleLinear),
              );
            }),
      ),
    );
  }
}
