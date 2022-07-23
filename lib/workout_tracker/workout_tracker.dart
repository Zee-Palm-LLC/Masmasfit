// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/workout_tracker/upcoming_workout_card.dart';
import 'package:masmas_fit/workout_tracker/workour_browse_card.dart';
import 'package:path/path.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/ingridient_meal_details.dart';
import 'package:masmas_fit/meal_planner/meal_schedule.dart';
import 'package:masmas_fit/meal_planner/nutirition_meal_details.dart';
import 'package:masmas_fit/meal_planner/recipe_step.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/like_button.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/workout_tracker/daily_wokrout_schedule.dart';
import 'package:masmas_fit/workout_tracker/workout_chart.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutTracker> createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> {
  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //       statusBarColor: Colors.transparent,
      //       statusBarIconBrightness: Brightness.dark),
      //   // leadingWidth: 62.w,
      //   // leading: Padding(
      //   //   padding: EdgeInsets.only(left: 30.0.w),
      //   //   child: Center(child: backButtonGrey(null)),
      //   // ),
      //   // title: Text(
      //   //   'Meal Schedule',
      //   //   style: TextFonts().kBold16,
      //   // ),
      //   // centerTitle: true,
      //   // actions: [
      //   //   Padding(
      //   //     padding: EdgeInsets.only(right: 30.w),
      //   //     child: Center(child: optionButton(null, () {})),
      //   //   )
      //   // ],

      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Stack(children: [
            Container(
              padding: EdgeInsets.only(bottom: 20.h),
              width: Get.width,
              height: 450.h,
              decoration: BoxDecoration(gradient: kBlueLinear),
              child: const Align(
                alignment: Alignment.center,
                child: WorkoutGraph(),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    )),
                width: Get.width,
                constraints: BoxConstraints(
                    minHeight: Get.height / 2, maxHeight: Get.height - 90.h),
                child: DraggableScrollableSheet(
                    expand: false,
                    builder: (context, scrollContainer) {
                      return SingleChildScrollView(
                        controller: scrollContainer,
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 132.w),
                                child: Container(
                                  width: 50.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                      color: kBlack.withOpacity(0.1),
                                      borderRadius:
                                          BorderRadius.circular(50.r)),
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              CheckDailyWorkoutScheduleCard(),
                              SizedBox(
                                height: 30.h,
                              ),
                              SizedBox(
                                width: 315.w,
                                height: 25.h,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        height: 50.h,
                                        width: 170.w,
                                        child: Text(
                                          'Upcoming Workout',
                                          style: TextFonts().kSemiBold16,
                                        )),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      'See more',
                                      style: TextFonts()
                                          .kRegular12
                                          .copyWith(color: kGrey2),
                                    ),
                                  ],
                                ),
                              ),
                              UpcomingWorkoutCard(
                                  workoutTime: workouts[0].workoutTime,
                                  color: kBlue2,
                                  workout: workouts[0].name,
                                  workoutIconPath: workouts[0].workoutIconPath),
                              SizedBox(
                                height: 15.h,
                              ),
                              UpcomingWorkoutCard(
                                  workoutTime: workouts[1].workoutTime,
                                  color: kBlue2,
                                  workout: workouts[1].name,
                                  workoutIconPath: workouts[1].workoutIconPath),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                'What Do You Want to Train',
                                style: TextFonts().kSemiBold16,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(bottom: 30.h),
                                itemCount: workouts.length,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 15.h,
                                  );
                                },
                                itemBuilder: (BuildContext context, int index) {
                                  return Center(
                                    child: WorkoutBrowseCard(
                                        workout: workouts[index]),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 315.w,
                  height: 32.h,
                  child: Row(
                    children: [
                      backButtonGrey(null),
                      const Expanded(child: SizedBox()),
                      Text(
                        'Workout Tracker',
                        style: TextFonts().kBold16.copyWith(color: kWhite),
                      ),
                      const Expanded(child: SizedBox()),
                      optionButton(null, () {})
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }

  List<WorkoutModel> workouts = [
    WorkoutModel(
        name: 'Fullbody workout',
        workoutTime: DateTime.now().add(3.hours),
        exerciseCount: 11,
        workoutDuration: 32.minutes,
        workoutIconPath: Assets().kFullbodyWorkoutIcon),
    WorkoutModel(
        name: 'Lowerbody workout',
        workoutTime: DateTime.now().add(1.days + 4.hours),
        exerciseCount: 12,
        workoutDuration: 40.minutes,
        workoutIconPath: Assets().kLowebodyWorkoutIcon),
    WorkoutModel(
        name: 'Upperbody workout',
        workoutTime: DateTime.now().add(6.hours),
        exerciseCount: 15,
        workoutDuration: 32.minutes,
        workoutIconPath: Assets().kUpperbodyWorkoutIcon),
    WorkoutModel(
        name: 'Ab workout',
        workoutTime: DateTime.now().add(2.days + 2.hours),
        exerciseCount: 12,
        workoutDuration: 40.minutes,
        workoutIconPath: Assets().kAbWorkoutIcon),
  ];
}

class IngredientModel {
  String ingredientName;
  String ingredienntIcon;
  double quantity;
  String unit;
  IngredientModel({
    required this.ingredientName,
    required this.ingredienntIcon,
    required this.quantity,
    required this.unit,
  });
}

class WorkoutModel {
  final String name;
  final DateTime workoutTime;
  final int exerciseCount;
  final Duration workoutDuration;
  final String workoutIconPath;
  WorkoutModel({
    required this.name,
    required this.workoutTime,
    required this.exerciseCount,
    required this.workoutDuration,
    required this.workoutIconPath,
  });
}
