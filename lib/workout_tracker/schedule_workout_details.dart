// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class ScheduleWorkoutDetail extends StatefulWidget {
  DateTime workoutTime;
  ScheduleWorkoutDetail({
    Key? key,
    required this.workoutTime,
  }) : super(key: key);

  @override
  State<ScheduleWorkoutDetail> createState() => _ScheduleWorkoutDetailState();
}

class _ScheduleWorkoutDetailState extends State<ScheduleWorkoutDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        color: kBlue2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: () async {
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 260.h,
                  decoration: BoxDecoration(
                      gradient: kBlueLinear,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22.r),
                          topRight: Radius.circular(22.r))),
                  child: CupertinoDatePicker(
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: widget.workoutTime,
                    onDateTimeChanged: (date) {
                      setState(() {
                        widget.workoutTime = date;
                      });
                    },
                  ),
                );
              });
        },
        child: Row(
          children: [
            SizedBox(width: 15.w),
            Icon(Icons.calendar_month_rounded, color: kGrey1, size: 22.w),
            SizedBox(
              width: 10.w,
            ),
            Text('Schedule Workout',
                style: TextFonts().kRegular12.copyWith(color: kGrey1)),
            const Expanded(child: SizedBox()),
            Text(
              '${DateFormat.Md().format(widget.workoutTime)}, ${DateFormat.jm().format(widget.workoutTime)}',
              style: TextFonts().kRegular10.copyWith(color: kGrey1),
            ),
            Icon(Icons.navigate_next_rounded, color: kGrey1, size: 20.w),
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }
}
