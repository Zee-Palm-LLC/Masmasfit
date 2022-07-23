import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/colors.dart';
import 'dart:math' as math;

class AddWorkoutWorkoutChooseWorkout extends StatefulWidget {
  AddWorkoutWorkoutChooseWorkout({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWorkoutWorkoutChooseWorkout> createState() =>
      _AddWorkoutWorkoutChooseWorkoutState();
}

class _AddWorkoutWorkoutChooseWorkoutState
    extends State<AddWorkoutWorkoutChooseWorkout> {
  int workoutIndex = 0;
  List<String> workouts = ['Upperbody', "Lowerbody", "Ab", 'Fullbody'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: kBorderColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: () async {
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: 130.h,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22.r),
                            topRight: Radius.circular(22.r))),
                    child: CupertinoPicker(
                      itemExtent: 32.h,
                      onSelectedItemChanged: (int value) {
                        setState(() {
                          workoutIndex = value;
                        });
                      },
                      children: List<Widget>.generate(
                        workouts.length,
                        (index) => Text(
                          '${workouts[index]} Workout',
                          style: TextFonts().kMedium16.copyWith(color: kGrey1),
                        ),
                      ),
                    ));
              });
        },
        child: Row(
          children: [
            SizedBox(width: 15.w),
            Transform.rotate(
                angle: 45 * math.pi / 180,
                child: LineIcon.dumbbell(color: kGrey1, size: 20.w)),
            SizedBox(
              width: 10.w,
            ),
            Text('Choose Workout',
                style: TextFonts().kRegular12.copyWith(color: kGrey1)),
            const Expanded(child: SizedBox()),
            Text(
              '${workouts[workoutIndex]} Workout',
              style: TextFonts().kRegular10.copyWith(color: kGrey2),
            ),
            Icon(Icons.navigate_next_rounded, color: kGrey1, size: 16.w),
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }
}
