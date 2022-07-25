// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:line_icons/line_icon.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/sleep_tracker/alarm_card.dart';
import 'package:masmas_fit/sleep_tracker/bedtime_card.dart';
import 'package:masmas_fit/sleep_tracker/check_sleep_schedule_card.dart';
import 'package:masmas_fit/sleep_tracker/last_night_sleep_card.dart';
import 'package:masmas_fit/sleep_tracker/sleep_chart.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';
import 'package:masmas_fit/workout_tracker/wokrout_details.dart';
import 'package:masmas_fit/workout_tracker/wokrout_steps.dart';

class ExerciseDetails extends StatefulWidget {
  final ExerciseModel exercise;
  const ExerciseDetails({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  State<ExerciseDetails> createState() => _ExerciseDetailsState();
}

class _ExerciseDetailsState extends State<ExerciseDetails> {
  bool readMore = false;
  int repTimes = 30;
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Center(child: optionButton(null, () {})),
          )
        ],
        backgroundColor: kWhite,
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 315.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: kBlack.withOpacity(0.3)),
                  child: Icon(
                    CupertinoIcons.play_circle_fill,
                    color: kWhite,
                    size: 28.w,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  widget.exercise.exerciseName,
                  style: TextFonts().kBold16,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text('Easy | ${Random().nextInt(500) + 150} Calories Burn',
                    style: TextFonts().kRegular12.copyWith(color: kGrey1)),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Descriptions',
                  style: TextFonts().kBold16,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                    width: 315.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            "A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                            maxLines: readMore ? 10 : 3,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextFonts().kRegular12.copyWith(color: kGrey1)),
                        InkWell(
                          onTap: () => setState(() => readMore = !readMore),
                          child: GradientText(
                            readMore ? 'Read less...' : 'Read more...',
                            style: TextFonts().kMedium12,
                            gradient: kBlueLinear,
                          ),
                        )
                      ],
                    )),
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
                            "How To Do It",
                            style: TextFonts().kSemiBold16,
                          )),
                      const Expanded(child: SizedBox()),
                      Text(
                        '${steps.length} steps',
                        style: TextFonts().kRegular12.copyWith(color: kGrey2),
                      ),
                    ],
                  ),
                ),
                IllustratedExerciseSteps(steps: steps),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Custom Repititions',
                  style: TextFonts().kBold16,
                ),
                SizedBox(
                  width: 315.w,
                  height: 155.h,
                  child: Center(
                    child: CupertinoPicker(
                      squeeze: 1,
                      selectionOverlay:
                          //CupertinoPickerDefaultSelectionOverlay(),
                          Container(
                        width: Get.width,
                        height: 26.h,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                top: BorderSide(color: kGrey3, width: 0.8.h),
                                bottom:
                                    BorderSide(color: kGrey3, width: 0.8.h))),
                      ),
                      itemExtent: 46.h,
                      onSelectedItemChanged: (int value) {
                        setState(() {
                          repTimes = value;
                        });
                      },
                      children: List<Widget>.generate(
                          40,
                          (index) => Center(
                                  child: SizedBox(
                                height: 46.h,
                                width: 315.w,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24.w,
                                    ),
                                    LineIcon.fire(
                                      color: kDanger,
                                      size: 14.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      '450 Calories Burn',
                                      style: TextFonts()
                                          .kRegular10
                                          .copyWith(color: kGrey2),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      '${20 + index}',
                                      style: TitleFonts()
                                          .kMedium20
                                          .copyWith(color: kGrey1),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'times',
                                      style: TextFonts()
                                          .kRegular16
                                          .copyWith(color: kGrey2),
                                    )
                                  ],
                                ),
                              ))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 95.h,
                )
              ],
            ),
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

  List<ExerciseSteps> steps = [
    ExerciseSteps(
        title: "Spread Your Arms",
        subtitle:
            "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."),
    ExerciseSteps(
        title: 'Rest at The Toe',
        subtitle:
            "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"),
    ExerciseSteps(
        title: "Adjust Foot Movement",
        subtitle:
            "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."),
    ExerciseSteps(
        title: "Clapping Both Hands",
        subtitle:
            "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack")
  ];
}

class ExerciseSteps {
  final String title;
  final String subtitle;
  ExerciseSteps({
    required this.title,
    required this.subtitle,
  });
}
