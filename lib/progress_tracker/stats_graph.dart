// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class StatsGraph extends StatefulWidget {
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;
  const StatsGraph({
    Key? key,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.color4,
  }) : super(key: key);

  @override
  State<StatsGraph> createState() => _StatsGraphState();
}

class _StatsGraphState extends State<StatsGraph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 172.h,
      width: 315.w,
      child: SfCartesianChart(
          trackballBehavior: TrackballBehavior(
            tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
            lineColor: kBlue2,
            lineDashArray: [3, 2],
            activationMode: ActivationMode.singleTap,
            enable: true,
          ),
          margin: EdgeInsets.only(left: 10.w),
          plotAreaBorderWidth: 0,
          primaryYAxis: NumericAxis(
              labelStyle: TextFonts().kRegular10.copyWith(color: kGrey1),
              interval: 20,
              minimum: 0,
              maximum: 100,
              labelFormat: '{value}%',
              opposedPosition: true,
              axisLine: AxisLine(color: Colors.transparent),
              labelAlignment: LabelAlignment.center,
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: MajorGridLines(color: kGrey2)),
          primaryXAxis: CategoryAxis(
              labelStyle: TextFonts().kRegular12.copyWith(color: kGrey1),
              majorTickLines: const MajorTickLines(size: 0),
              labelPlacement: LabelPlacement.onTicks,
              majorGridLines: const MajorGridLines(width: 0),
              isInversed: true),
          series: <ChartSeries>[
            SplineSeries<MultiChartData, String>(
              color: widget.color1,
              name: 'Lose Weight',
              dataSource: chartData,
              xValueMapper: (MultiChartData data, _) => data.month,
              yValueMapper: (MultiChartData data, _) => data.loseWeight,
            ),
            SplineSeries<MultiChartData, String>(
              color: widget.color2,
              name: 'Height Increase',
              dataSource: chartData,
              xValueMapper: (MultiChartData data, _) => data.month,
              yValueMapper: (MultiChartData data, _) => data.heightIncrease,
            ),
            SplineSeries<MultiChartData, String>(
              color: widget.color3,
              name: 'Muscle Mass Increase',
              dataSource: chartData,
              xValueMapper: (MultiChartData data, _) => data.month,
              yValueMapper: (MultiChartData data, _) => data.mmIncrease,
            ),
            SplineSeries<MultiChartData, String>(
              color: widget.color4,
              name: 'Abs',
              dataSource: chartData,
              xValueMapper: (MultiChartData data, _) => data.month,
              yValueMapper: (MultiChartData data, _) => data.abs,
            )
          ]),
    );
  }

  List<MultiChartData> chartData = [
    MultiChartData(
        month: 'Jan',
        loseWeight: 33,
        heightIncrease: 40,
        mmIncrease: 88,
        abs: 26),
    MultiChartData(
        month: 'Feb',
        loseWeight: 66,
        heightIncrease: 25,
        mmIncrease: 33,
        abs: 52),
    MultiChartData(
        month: 'Mar',
        loseWeight: 10,
        heightIncrease: 15,
        mmIncrease: 23,
        abs: 72),
    MultiChartData(
        month: 'May',
        loseWeight: 25,
        heightIncrease: 35,
        mmIncrease: 27,
        abs: 100),
    MultiChartData(
        month: 'Jun',
        loseWeight: 50,
        heightIncrease: 50,
        mmIncrease: 66,
        abs: 95),
    MultiChartData(
        month: 'Jul',
        loseWeight: 75,
        heightIncrease: 66,
        mmIncrease: 80,
        abs: 100)
  ];
}

class MultiChartData {
  String month;
  double loseWeight;
  double heightIncrease;
  double mmIncrease;
  double abs;
  MultiChartData({
    required this.month,
    required this.loseWeight,
    required this.heightIncrease,
    required this.mmIncrease,
    required this.abs,
  });
}
