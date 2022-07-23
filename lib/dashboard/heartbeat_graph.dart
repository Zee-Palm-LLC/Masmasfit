// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:developer' as dev;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class HeartBeatGraphBox extends StatefulWidget {
  const HeartBeatGraphBox({Key? key}) : super(key: key);

  @override
  State<HeartBeatGraphBox> createState() => _HeartBeatGraphBoxState();
}

class _HeartBeatGraphBoxState extends State<HeartBeatGraphBox> {
  List<ChartData> heartBeats = List<ChartData>.generate(
      40,
      (index) => ChartData(
          x: index + 1,
          y: Random().nextBool()
              ? 80 + Random().nextDouble() * 10
              : 80 - Random().nextDouble() * 5));
  double heartRate = 80;
  final TrackballBehavior _behavior = TrackballBehavior(
      markerSettings: TrackballMarkerSettings(
          height: 6.w,
          width: 6.w,
          color: kWhite,
          borderColor: kPurple2,
          borderWidth: 3.w,
          markerVisibility: TrackballVisibilityMode.visible),
      lineWidth: 0,
      activationMode: ActivationMode.singleTap,
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
      builder: (context, trackballDetails) {
        // setState(() {
        //
        // });

        return Container(
            width: 73.w,
            height: 25.h,
            decoration: BoxDecoration(
                gradient: kPurpleLinear,
                borderRadius: BorderRadius.circular(50.r),
                boxShadow: [kCardShadow]),
            child: Center(
                child: Text(
              '${trackballDetails.point?.x} mins ago',
              style: TextFonts().kRegular10.copyWith(color: kWhite),
            )));
      });
  //List<double> heartBeats = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 315.w,
        height: 150.h,
        decoration: BoxDecoration(
            color: kBlue2.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.r)),
        child: Stack(
          children: [
            SizedBox(
              width: 315.w,
              height: 150.h,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                // onTrackballPositionChanging: ((trackballArgs) {
                //   heartRate = trackballArgs.chartPointInfo.yPosition!;

                //   setState(() {
                //     heartRate = heartRate.roundToDouble();
                //   });
                // }),

                trackballBehavior: _behavior,
                margin: EdgeInsets.zero,
                borderWidth: 0,
                primaryXAxis: NumericAxis(
                  isInversed: true,
                  isVisible: false,
                ),
                primaryYAxis: NumericAxis(
                    isVisible: false, minimum: 70, maximum: 100, interval: 1),
                series: <ChartSeries>[
                  AreaSeries<ChartData, int>(
                      borderGradient: kBlueLinear,
                      borderWidth: 1.2.w,
                      gradient: kGraphLinearTransluscent,
                      //color: kBlack,
                      dataSource: heartBeats,
                      xValueMapper: (ChartData data, _) {
                        return data.x;
                      },
                      yValueMapper: (ChartData data, _) {
                        return data.y;
                      })
                ],
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15.w, top: 15.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Heart Rate',
                      style: TextFonts().kMedium12,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    GradientText(
                      '$heartRate bpm',
                      style: TextFonts().kSemiBold14,
                      gradient: kBlueLinear,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class ChartData {
  final int x;
  final double y;
  ChartData({
    required this.x,
    required this.y,
  });
}
