// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/workout_tracker/add_workout_choose_workout.dart';
import 'package:masmas_fit/workout_tracker/add_workout_difficulty_picker.dart';
import 'package:masmas_fit/workout_tracker/custom_repititions.dart';
import 'package:masmas_fit/workout_tracker/custom_weights.dart';
import 'package:masmas_fit/workout_tracker/wokrout_difficulty_picker.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_item_card.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_meal.dart';
import 'package:masmas_fit/meal_planner/nutrition_progress_bar.dart';
import 'package:masmas_fit/sleep_tracker/sleep_schedule.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class AddWorkoutSchedule extends StatefulWidget {
  const AddWorkoutSchedule({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWorkoutSchedule> createState() => _AddWorkoutScheduleState();
}

class _AddWorkoutScheduleState extends State<AddWorkoutSchedule> {
  DateTime dateOfWorkout = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        leadingWidth: 62.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.0.w),
          child: Center(child: backButtonGrey(null)),
        ),
        title: Text(
          'Add Schedule',
          style: TextFonts().kBold16,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Center(child: optionButton(null, () {})),
          )
        ],
        backgroundColor: kWhite,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.h),
              InkWell(
                onTap: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 260.h,
                          decoration: BoxDecoration(
                              color: kWhite,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(22.r),
                                  topRight: Radius.circular(22.r))),
                          child: CupertinoDatePicker(
                            //TODO ADD CIELING
                            //maximumDate: DateTime.now().subtract(Duration(days:3652.5)),
                            dateOrder: DatePickerDateOrder.dmy,
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: dateOfWorkout,
                            onDateTimeChanged: (date) {
                              setState(() {
                                dateOfWorkout = date;
                              });
                            },
                          ),
                        );
                      });
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.calendar,
                      color: kGrey1,
                      size: 18.w,
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    Text(
                      DateFormat.yMMMEd().format(dateOfWorkout),
                      style: TextFonts().kRegular14.copyWith(color: kGrey1),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Time",
                style: TextFonts().kMedium14,
              ),
              SizedBox(
                height: 108.h,
                width: 315.w,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    backgroundColor: kWhite,
                    initialDateTime: dateOfWorkout,
                    onDateTimeChanged: (date) {
                      setState(() {
                        dateOfWorkout = date;
                      });
                    }),
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Details Workout",
                style: TextFonts().kMedium14,
              ),
              SizedBox(
                height: 10.h,
              ),
              AddWorkoutWorkoutChooseWorkout(),
              SizedBox(
                height: 10.h,
              ),
              AddWorkoutDifficultPicker(),
              SizedBox(
                height: 10.h,
              ),
              CustomRepititions(),
              SizedBox(
                height: 10.h,
              ),
              CustomWeights(),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 315.w,
        height: 54.h,
        decoration: BoxDecoration(boxShadow: [kBlueShadow]),
        child: RawMaterialButton(
            padding: EdgeInsets.only(right: 30.w),
            child: GradientButton(
                gradient: kBlueLinear,
                increaseHeightBy: 18.h,
                increaseWidthBy: 250.w,
                child: Text(
                  'Save',
                  style: TextFonts().kBold16.copyWith(color: kWhite),
                ),
                callback: () {}),
            onPressed: () {}),
      ),
    );
  }
}
