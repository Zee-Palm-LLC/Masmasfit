// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class WorkoutGraph extends StatefulWidget {
  const WorkoutGraph({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutGraph> createState() => _WorkoutGraphState();
}

class _WorkoutGraphState extends State<WorkoutGraph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 172.h,
      width: 315.w,
      child: SfCartesianChart(
          //enableAxisAnimation: true,
          trackballBehavior: TrackballBehavior(
              tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
              lineColor: kWhite.withOpacity(0.5),
              lineWidth: 18.w,
              activationMode: ActivationMode.singleTap,
              enable: true,
              builder: (context, ballDetails) {
                return Container(
                  width: 130.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [kCardShadow],
                  ),
                  padding: EdgeInsets.only(top: 10.h, left: 10.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            DateFormat.MMMEd().format(
                              workouts[ballDetails.pointIndex!].day,
                            ),
                            style:
                                TextFonts().kRegular8.copyWith(color: kGrey2),
                          ),
                          SizedBox(
                            width: 33.w,
                          ),
                          Text(
                            '${workouts[ballDetails.pointIndex!].percentage.round().toString()}%',
                            style: TextFonts().kRegular8.copyWith(
                                color: workouts[ballDetails.pointIndex!]
                                            .percentage <
                                        50
                                    ? kDanger
                                    : kSuccess),
                          ),
                          Icon(
                              workouts[ballDetails.pointIndex!].percentage < 50
                                  ? Icons.arrow_downward_rounded
                                  : Icons.arrow_upward_rounded,
                              color:
                                  workouts[ballDetails.pointIndex!].percentage <
                                          50
                                      ? kDanger
                                      : kSuccess,
                              size: 8.w),
                        ],
                      ),
                      Text(
                        workouts[ballDetails.pointIndex!].workoutType,
                        style: TextFonts().kRegular10,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        width: 110.w,
                        height: 5.h,
                        child: Row(children: [
                          Container(
                            width:
                                (workouts[ballDetails.pointIndex!].percentage /
                                        100) *
                                    110.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                                gradient: kPogressBarLinear,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.r),
                                    bottomLeft: Radius.circular(5.r))),
                          ),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                color: kBorderColor,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.r),
                                    bottomRight: Radius.circular(5.r))),
                          ))
                        ]),
                      )
                    ],
                  ),
                );
              }),
          margin: EdgeInsets.only(left: 10.w),
          plotAreaBorderWidth: 0,
          primaryYAxis: NumericAxis(
              labelStyle: TextFonts().kRegular10.copyWith(color: kWhite),
              interval: 20,
              minimum: 0,
              maximum: 100,
              labelFormat: '{value}%',
              opposedPosition: true,
              axisLine: AxisLine(color: Colors.transparent),
              labelAlignment: LabelAlignment.center,
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: MajorGridLines(color: kBorderColor)),
          primaryXAxis: CategoryAxis(
              labelAlignment: LabelAlignment.center,
              interval: 1,
              axisLine: AxisLine(width: 0),
              labelStyle: TextFonts().kRegular12.copyWith(color: kWhite),
              majorTickLines: const MajorTickLines(size: 0),
              labelPlacement: LabelPlacement.onTicks,
              majorGridLines: const MajorGridLines(width: 0),
              isInversed: true),
          series: <ChartSeries>[
            SplineSeries<WokroutChartData, String>(
              width: 2.2.w,
              color: kWhite.withOpacity(0.7),
              name: 'Calories',
              dataSource: workouts,
              xValueMapper: (WokroutChartData data, _) =>
                  DateFormat.E().format(data.day),
              yValueMapper: (WokroutChartData data, _) => data.percentage,
            ),
          ]),
    );
  }

  List<WokroutChartData> workouts = [
    WokroutChartData(
        day: DateTime.now(), percentage: 40, workoutType: 'Upperbody Workout'),
    WokroutChartData(
        day: DateTime.now().add(1.days),
        percentage: 20,
        workoutType: 'Upperbody Workout'),
    WokroutChartData(
        day: DateTime.now().add(2.days),
        percentage: 70,
        workoutType: 'Fullbody Workout'),
    WokroutChartData(
        day: DateTime.now().add(3.days),
        percentage: 94,
        workoutType: 'Lowerbody Workout'),
    WokroutChartData(
        day: DateTime.now().add(4.days),
        percentage: 25,
        workoutType: 'Fullbody Workout'),
    WokroutChartData(
        day: DateTime.now().add(5.days),
        percentage: 70,
        workoutType: "UpperBody Workout"),
    WokroutChartData(
        day: DateTime.now().add(6.days),
        percentage: 70,
        workoutType: "UpperBody Workout"),
  ];
}

class WokroutChartData {
  final DateTime day;
  final double percentage;
  final String workoutType;

  WokroutChartData({
    required this.day,
    required this.percentage,
    required this.workoutType,
  });
}
