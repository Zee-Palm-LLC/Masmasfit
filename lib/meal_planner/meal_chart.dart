import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:masmas_fit/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/text_fonts.dart';

class MealStatsGraph extends StatefulWidget {
  const MealStatsGraph({
    Key? key,
  }) : super(key: key);

  @override
  State<MealStatsGraph> createState() => _MealStatsGraphState();
}

class _MealStatsGraphState extends State<MealStatsGraph> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 172.h,
      width: 315.w,
      child: SfCartesianChart(
          //enableAxisAnimation: true,
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
          ),
          series: <ChartSeries>[
            SplineAreaSeries<FoodChartData, String>(
              borderWidth: 2.2.w,
              borderGradient: kMoolitAsteroid,
              color: Colors.transparent,
              name: 'Calories',
              dataSource: chartData,
              xValueMapper: (FoodChartData data, _) => data.day,
              yValueMapper: (FoodChartData data, _) => data.calories,
            ),
            SplineAreaSeries<FoodChartData, String>(
              borderWidth: 2.2.w,
              borderGradient: kCitrusPeel,
              color: Colors.transparent,
              name: 'Fibre',
              dataSource: chartData,
              xValueMapper: (FoodChartData data, _) => data.day,
              yValueMapper: (FoodChartData data, _) => data.fibre,
            ),
            SplineAreaSeries<FoodChartData, String>(
              borderWidth: 2.2.w,
              borderGradient: kPurpleLinear,
              color: Colors.transparent,
              name: 'Fats',
              dataSource: chartData,
              xValueMapper: (FoodChartData data, _) => data.day,
              yValueMapper: (FoodChartData data, _) => data.fats,
            ),
            SplineAreaSeries<FoodChartData, String>(
              borderWidth: 2.2.w,
              borderGradient: kBlueLinear,
              color: Colors.transparent,
              name: 'Sugar',
              dataSource: chartData,
              xValueMapper: (FoodChartData data, _) => data.day,
              yValueMapper: (FoodChartData data, _) => data.sugar,
            )
          ]),
    );
  }

  List<FoodChartData> chartData = [
    FoodChartData(day: 'Sun', calories: 60, fibre: 50, fats: 70, sugar: 26),
    FoodChartData(day: 'Mon', calories: 50, fibre: 60, fats: 33, sugar: 52),
    FoodChartData(day: 'Tue', calories: 70, fibre: 50, fats: 23, sugar: 72),
    FoodChartData(day: 'Wed', calories: 35, fibre: 45, fats: 27, sugar: 100),
    FoodChartData(day: 'Thu', calories: 80, fibre: 70, fats: 66, sugar: 50),
    FoodChartData(day: 'Fri', calories: 80, fibre: 66, fats: 80, sugar: 100),
    FoodChartData(day: 'Sat', calories: 60, fibre: 10, fats: 80, sugar: 40)
  ];
}

class FoodChartData {
  String day;
  double calories;
  double fibre;
  double fats;
  double sugar;
  FoodChartData({
    required this.day,
    required this.calories,
    required this.fibre,
    required this.fats,
    required this.sugar,
  });
}
