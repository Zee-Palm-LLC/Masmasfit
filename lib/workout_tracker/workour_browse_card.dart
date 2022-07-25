// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/workout_tracker/wokrout_details.dart';

import 'package:masmas_fit/workout_tracker/workout_tracker.dart';

class WorkoutBrowseCard extends StatelessWidget {
  final WorkoutModel workout;
  const WorkoutBrowseCard({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: 315.w,
      height: 150.h,
      decoration: BoxDecoration(
          color: kBlue2.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.r)),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 10.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  workout.name,
                  style: TextFonts().kMedium14,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '${workout.exerciseCount} Exercises | ${workout.workoutDuration.inMinutes}mins',
                  style: TextFonts().kRegular12.copyWith(color: kGrey1),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: kWhite,
                        minimumSize: Size(94.w, 35.h),
                        maximumSize: Size(94.w, 35.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r))),
                    onPressed: () {
                      Get.to(() => WorkoutDetails(
                          workout: workout,
                          heroTag: 'workout-browse-${workout.name}'));
                    },
                    child: GradientText(
                      'View more',
                      style: TextFonts().kMedium10,
                      gradient: kBlueLinear,
                    ))
              ],
            ),
            const Expanded(child: SizedBox()),
            SizedBox(
              width: 110.w,
              height: 110.w,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20.h),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kWhite.withOpacity(0.5)),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 110.w,
                        height: 110.w,
                        child: Hero(
                          tag: 'workout-browse-${workout.name}',
                          child: Material(
                            color: Colors.transparent,
                            child: SvgPicture.asset(
                              workout.workoutIconPath,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
      ),
    );
  }
}
