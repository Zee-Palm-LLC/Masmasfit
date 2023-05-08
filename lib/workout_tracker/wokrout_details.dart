// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/workout_tracker/exercise_detail.dart';
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
import 'package:masmas_fit/workout_tracker/schedule_workout_details.dart';
import 'package:masmas_fit/workout_tracker/wokrout_difficulty_picker.dart';
import 'package:masmas_fit/workout_tracker/workout_tracker.dart';

class WorkoutDetails extends StatefulWidget {
  final WorkoutModel workout;
  final String heroTag;

  const WorkoutDetails({
    Key? key,
    required this.workout,
    required this.heroTag,
  }) : super(key: key);

  @override
  State<WorkoutDetails> createState() => _WorkoutDetailsState();
}

class _WorkoutDetailsState extends State<WorkoutDetails> {
  bool liked = false;
  bool readMore = false;
  final int calories = Random().nextInt(500) + 150;
  @override
  Widget build(BuildContext context) {
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
            Hero(
              tag: widget.heroTag,
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.only(bottom: 20.h),
                  width: Get.width,
                  height: 450.h,
                  decoration: BoxDecoration(gradient: kBlueLinear),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 288.w,
                          height: 288.w,
                          decoration: BoxDecoration(
                            color: kWhite.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 316.w,
                          height: 316.w,
                          child: SvgPicture.asset(
                            widget.workout.workoutIconPath,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
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
                child: DraggableScrollableSheet(
                    initialChildSize: 0.55,
                    maxChildSize: 0.875,
                    minChildSize: 0.55,
                    expand: false,
                    builder: (context, scrollContainer) {
                      return ListView(
                        padding: EdgeInsets.only(top: 15.h),
                        controller: scrollContainer,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 162.w),
                            child: Container(
                              width: 50.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                  color: kBlack.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(50.r)),
                            ),
                          ),
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: SizedBox(
                              width: 315.w,
                              height: 50.h,
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.workout.name,
                                        style: TextFonts().kBold16,
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Text(
                                          '${widget.workout.exerciseCount} Exercises | ${widget.workout.workoutDuration.inMinutes}mins | $calories Calories Burn',
                                          style: TextFonts()
                                              .kRegular12
                                              .copyWith(color: kGrey1))
                                    ],
                                  ),
                                  const Expanded(child: SizedBox()),
                                  LikeButtonn(
                                      liked: liked,
                                      changeLike: () => setState(() {
                                            liked = !liked;
                                          }))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                            child: ScheduleWorkoutDetail(
                                workoutTime: widget.workout.workoutTime),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                            child: WorkoutDifficultPicker(),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                            child: SizedBox(
                              width: 315.w,
                              height: 25.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      height: 50.h,
                                      width: 170.w,
                                      child: Text(
                                        "You'll Need",
                                        style: TextFonts().kSemiBold16,
                                      )),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    '5 Items',
                                    style: TextFonts()
                                        .kRegular12
                                        .copyWith(color: kGrey2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: 178.h, maxWidth: Get.width),
                            child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              itemCount: equipments.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 15.w,
                                );
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return Center(
                                  child: EquipmentCard(
                                      equipment: equipments[index]),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                            child: SizedBox(
                              width: 315.w,
                              height: 25.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                      height: 50.h,
                                      width: 170.w,
                                      child: Text(
                                        "Exercises",
                                        style: TextFonts().kSemiBold16,
                                      )),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    '2 sets',
                                    style: TextFonts()
                                        .kRegular12
                                        .copyWith(color: kGrey2),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0.w),
                            child: Text(
                              "Set 1",
                              style: TextFonts().kMedium12,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: set1.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 15.h,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                  child: ExerciseCard(exercise: set1[index]));
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30.0.w),
                            child: Text(
                              "Set 2",
                              style: TextFonts().kMedium12,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: set1.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: 15.h,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return Center(
                                  child: ExerciseCard(
                                      exercise: set1[set1.length - index - 1]));
                            },
                          ),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
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
                      optionButton(null, () {})
                    ],
                  ),
                ),
              ),
            )
          ]),
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
                  'Start Workout',
                  style: TextFonts().kBold16.copyWith(color: kWhite),
                ),
                callback: () {}),
            onPressed: () {}),
      ),
    );
  }

  List<EquipmentCardData> equipments = [
    EquipmentCardData(
        equipmentName: 'Barbell', equipmentICon: Assets().kBarbell),
    EquipmentCardData(
        equipmentName: 'Skipping Rop', equipmentICon: Assets().kSkippingRope),
    EquipmentCardData(
        equipmentName: 'Barbell', equipmentICon: Assets().kBarbell),
    EquipmentCardData(
        equipmentName: 'Skipping Rop', equipmentICon: Assets().kSkippingRope),
    EquipmentCardData(
        equipmentName: 'Barbell', equipmentICon: Assets().kBarbell),
  ];
  List<ExerciseModel> set1 = [
    ExerciseModel(
        exerciseName: 'Warmup',
        exerciseImage: images[0],
        reps: 0,
        duration: 5.minutes),
    ExerciseModel(
        exerciseName: 'Skipping',
        exerciseImage: images[2],
        reps: 0,
        duration: 2.minutes),
    ExerciseModel(exerciseName: 'Squats', exerciseImage: images[3], reps: 20),
    ExerciseModel(
        exerciseName: 'Arm Raises', exerciseImage: images[4], reps: 15),
    ExerciseModel(
        exerciseName: 'Rest And Drink',
        exerciseImage: images[5],
        reps: 0,
        duration: 2.minutes)
  ];
}

class EquipmentCardData {
  final String equipmentName;
  final String equipmentICon;
  EquipmentCardData({
    required this.equipmentName,
    required this.equipmentICon,
  });
}

class EquipmentCard extends StatelessWidget {
  final EquipmentCardData equipment;
  const EquipmentCard({
    Key? key,
    required this.equipment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 130.w,
          width: 130.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: kBorderColor),
          alignment: Alignment.center,
          child: SizedBox(
            height: 85.w,
            width: 85.w,
            child: SvgPicture.asset(
              equipment.equipmentICon,
              fit: BoxFit.contain,
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          equipment.equipmentName,
          style: TextFonts().kRegular12,
        )
      ],
    );
  }
}

class ExerciseModel {
  final String exerciseName;
  final String exerciseImage;
  final Duration? duration;
  final int reps;
  ExerciseModel({
    required this.exerciseName,
    required this.exerciseImage,
    this.duration,
    required this.reps,
  });
}

class ExerciseCard extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseCard({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ExerciseDetails(exercise: exercise),
            transition: Transition.circularReveal);
      },
      child: SizedBox(
        height: 65.h,
        width: 315.w,
        child: Row(
          children: [
            SizedBox(
              height: 60.w,
              width: 60.w,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.network(
                    exercise.exerciseImage,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  exercise.exerciseName,
                  style: TextFonts().kMedium14,
                ),
                SizedBox(
                  height: 5.h,
                ),
                exercise.duration == null
                    ? Text('${exercise.reps}x',
                        style: TextFonts().kMedium12.copyWith(color: kGrey1))
                    : Text(
                        printDuration(exercise.duration!),
                        style: TextFonts().kMedium12.copyWith(color: kGrey1),
                      )
              ],
            ),
            const Expanded(child: SizedBox()),
            LineIcon.chevronCircleRight(
              color: kGrey2,
              size: 24.w,
            )
          ],
        ),
      ),
    );
  }
}

String printDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return "$twoDigitMinutes:$twoDigitSeconds";
}

List<String> images = [
  'https://ychef.files.bbci.co.uk/1376x774/p07ztf1q.jpg',
  'https://cdn.jefit.com/wp/wp-content/uploads/2017/08/Fitness-Goals.jpg',
  'https://assets.entrepreneur.com/content/3x2/2000/20151012194720-woman-exercising-workout.jpeg',
  'https://montreall.com/wp-content/uploads/2014/02/WomensGyms.jpg',
  'https://www.bodybuilding.com/fun/images/2014/women-and-the-gym-top-10-mistakes_facebook-960x540.jpg',
  'https://image.shutterstock.com/shutterstock/photos/1089543866/display_1500/stock-photo-sexy-athletic-girl-working-out-in-gym-fitness-woman-doing-exercise-1089543866.jpg',
  'https://as1.ftcdn.net/v2/jpg/02/47/03/48/1000_F_247034826_8eP5Wcev5qUJ6L85Cme8gAh9akNWbPOZ.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crunches-royalty-free-image-1640004573.jpg',
  'https://thumbs.dreamstime.com/b/fitness-woman-working-out-gym-doing-exercise-back-athletic-girl-rear-view-247002111.jpg',
];
