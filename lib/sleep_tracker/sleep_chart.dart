import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SleepChart extends StatefulWidget {
  const SleepChart({Key? key}) : super(key: key);

  @override
  State<SleepChart> createState() => _SleepChartState();
}

class _SleepChartState extends State<SleepChart> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 315.w,
      child: SfCartesianChart(
          trackballBehavior: TrackballBehavior(
              markerSettings: TrackballMarkerSettings(
                  height: 6.w,
                  width: 6.w,
                  color: kWhite,
                  borderColor: kBlue1,
                  borderWidth: 3.w,
                  markerVisibility: TrackballVisibilityMode.visible),
              lineColor: kBlue2,
              lineDashArray: [3, 2],
              activationMode: ActivationMode.singleTap,
              enable: true,
              tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
              builder: (context, trackballDetails) {
                double percentage = trackballDetails.point!.y / 8;
                if (percentage < 1) {
                  percentage = (1 - percentage) * 100;
                } else {
                  percentage *= 100;
                }
                return Container(
                    width: 86.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [kCardShadow]),
                    child: Center(
                        child: Text(
                      '${percentage.round()}% ${(percentage < 100) ? 'decrease' : 'sleep'}',
                      style: TextFonts().kRegular10.copyWith(
                          color: (percentage < 100) ? kDanger : kSuccess),
                    )));
              }),
          margin: EdgeInsets.only(left: 10.w),
          plotAreaBorderWidth: 0,
          primaryYAxis: NumericAxis(
              labelStyle: TextFonts().kRegular10.copyWith(color: kGrey1),
              interval: 2,
              minimum: 0,
              maximum: 10,
              labelFormat: '{value}h',
              opposedPosition: true,
              axisLine: AxisLine(color: Colors.transparent),
              labelAlignment: LabelAlignment.center,
              majorTickLines: const MajorTickLines(size: 0),
              majorGridLines: MajorGridLines(color: kGrey2)),
          primaryXAxis: CategoryAxis(
              axisLine: AxisLine(width: 0),
              labelStyle: TextFonts().kRegular12.copyWith(color: kGrey1),
              majorTickLines: const MajorTickLines(size: 0),
              labelPlacement: LabelPlacement.onTicks,
              majorGridLines: const MajorGridLines(width: 0),
              isInversed: true),
          series: <ChartSeries>[
            SplineAreaSeries<ChartData, String>(
                borderGradient: kBlueLinear,
                borderWidth: 2.w,
                dataSource: chartData.reversed.toList(),
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                gradient: kGraphLinear)
          ]),
    );
  }

  List<ChartData> chartData = [
    ChartData('Sun', 2),
    ChartData('Mon', 5),
    ChartData('Tue', 3),
    ChartData('Wed', 6.5),
    ChartData('Thu', 5.5),
    ChartData('Fri', 4.75),
    ChartData('Sat', 8)
  ];
}
