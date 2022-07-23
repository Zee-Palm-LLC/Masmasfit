// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BMIPieChart extends StatefulWidget {
  final double bmi;
  const BMIPieChart({
    Key? key,
    required this.bmi,
  }) : super(key: key);

  @override
  State<BMIPieChart> createState() => _BMIPieChartState();
}

class _BMIPieChartState extends State<BMIPieChart> {
  List<ChartData> chartData = [];
  List<int> heartBeats = [];
  @override
  void initState() {
    setState(() {
      chartData = [
        ChartData(
            x: '',
            y: 50,
            gradient: kWhiteLinear,
            radius: '${((44 / 53) * 100).toString()}%'),
        ChartData(
            x: 'Bmi', y: widget.bmi, gradient: kPurpleLinear, radius: '100%'),
      ];
    });

    super.initState();
  }

  var random = new Random();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120.w,
      height: 120.w,
      child: SfCircularChart(
        series: <CircularSeries>[
          PieSeries<ChartData, String>(
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  //color: Colors.transparent,
                  textStyle: TextFonts().kSemiBold12.copyWith(color: kWhite)),
              dataLabelMapper: (ChartData data, index) {
                return data.y.toString();
              },
              startAngle: 90,
              endAngle: 90,
              dataSource: chartData,
              pointShaderMapper: (ChartData data, index, _, Rect rect) =>
                  data.gradient.createShader(rect),
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              pointRadiusMapper: (ChartData data, _) => data.radius),
        ],
      ),
    );
  }
}

class ChartData {
  final String x;
  final double y;
  final LinearGradient gradient;
  final String radius;
  ChartData({
    required this.x,
    required this.y,
    required this.gradient,
    required this.radius,
  });
}
