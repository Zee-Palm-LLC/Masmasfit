// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/progress_tracker/stat_progress_bar.dart';
import 'package:masmas_fit/progress_tracker/stats_graph.dart';
import 'package:masmas_fit/text_fonts.dart';

class ViewStatistics extends StatefulWidget {
  const ViewStatistics({Key? key}) : super(key: key);

  @override
  State<ViewStatistics> createState() => _ViewStatisticsState();
}

class _ViewStatisticsState extends State<ViewStatistics> {
  List<StatBlock> stats = [
    StatBlock(statName: 'Lose Weight', statPercentage: 33, color: color1),
    StatBlock(statName: 'Height Increase', statPercentage: 88, color: color2),
    StatBlock(
        statName: 'Muscle Mass Increase', statPercentage: 57, color: color3),
    StatBlock(statName: 'Abs', statPercentage: 89, color: color4)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30.h,
        ),
        StatsGraph(
            color1: color1, color2: color2, color3: color3, color4: color4),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
            width: 315.w,
            height: 25.h,
            child: Row(
              children: [
                Text(
                  'May',
                  style: TextFonts().kSemiBold16.copyWith(color: kGrey1),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  'June',
                  style: TextFonts().kSemiBold16.copyWith(color: kGrey1),
                )
              ],
            )),
        SizedBox(
          height: 10.h,
        ),
        ListView.separated(
            shrinkWrap: true,
            itemCount: stats.length,
            separatorBuilder: (context, index) => SizedBox(
                  height: 24.h,
                ),
            itemBuilder: ((context, index) {
              return StatProgressBar(
                  stat: stats[index].statName,
                  statPercentage: stats[index].statPercentage,
                  color: stats[index].color);
            })),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: 315.w,
          child: GradientButton(
              gradient: kBlueLinear,
              increaseHeightBy: 30.h,
              increaseWidthBy: 300.w,
              child: Text(
                'Back to Home',
                style: TextFonts().kBold16.copyWith(color: kWhite),
              ),
              callback: () {}),
        )
      ],
    );
  }
}

Color color1 = Colors.orange.shade100;
Color color2 = kWarning;
Color color3 = Colors.red.shade200;
Color color4 = Colors.green.shade200;

class StatBlock {
  String statName;
  double statPercentage;
  Color color;
  StatBlock({
    required this.statName,
    required this.statPercentage,
    required this.color,
  });
}
