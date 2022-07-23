// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/custom_switch.dart';

class UpcomingWorkoutCard extends StatefulWidget {
  final DateTime workoutTime;
  final Color color;
  final String workout;
  final String workoutIconPath;
  UpcomingWorkoutCard({
    Key? key,
    required this.workoutTime,
    required this.color,
    required this.workout,
    required this.workoutIconPath,
  }) : super(key: key);

  @override
  State<UpcomingWorkoutCard> createState() => _UpcomingWorkoutCardState();
}

class _UpcomingWorkoutCardState extends State<UpcomingWorkoutCard> {
  bool activated = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [kCardShadow]),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Container(
            height: 50.w,
            width: 50.w,
            padding: EdgeInsets.only(top: 10.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: widget.color.withOpacity(0.3)),
            child: SvgPicture.asset(
              widget.workoutIconPath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.workout, style: TextFonts().kMedium12),
              SizedBox(
                height: 5.h,
              ),
              Text(
                '${DateFormat.Md().format(widget.workoutTime)}, ${DateFormat.Hm().format(widget.workoutTime)}',
                style: TextFonts().kRegular10.copyWith(color: kGrey2),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          CustomSwitch(
              borderRadius: 50.r,
              width: 44.w,
              height: 25.h,
              inactiveColor: kGrey2.withOpacity(0.2),
              value: activated,
              onChanged: (value) {
                setState(() {
                  activated = value;
                });
              },
              gradient: kPurpleLinear)
        ],
      ),
    );
  }
}
