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
import 'package:masmas_fit/workout_tracker/add_workout_schedule.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_core/theme.dart';
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

class WorkoutSchedule extends StatefulWidget {
  const WorkoutSchedule({Key? key}) : super(key: key);

  @override
  State<WorkoutSchedule> createState() => _WorkoutScheduleState();
}

class _WorkoutScheduleState extends State<WorkoutSchedule> {
  List<DateTime> theWeek = [
    ...List<DateTime>.generate(
        7, (index) => DateTime.now().subtract(Duration(days: index))),
    ...List<DateTime>.generate(
        7,
        (index) => (DateTime.now().add(const Duration(days: 1)))
            .add(Duration(days: index)))
  ];
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
  @override
  void initState() {
    theWeek.sort((a, b) {
      return a.compareTo(b);
    });
    for (int i = 0; i < theWeek.length; i++) {
      theWeek[i] = DateTime(theWeek[i].year, theWeek[i].month, theWeek[i].day);
    }

    super.initState();
  }

  int initialIndex = 7;
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 80.w * 5);
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
          'Workout Schedule',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //date thing
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool active = index == initialIndex;
                    return Center(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                initialIndex = index;
                              });
                            },
                            child: dateCard(theWeek[index], active)));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15.w,
                    );
                  },
                  itemCount: theWeek.length),
            ),

            SizedBox(
              height: 24 * 38.h,
              child: SfCalendarTheme(
                data: SfCalendarThemeData(
                    cellBorderColor: kBorderColor,
                    backgroundColor: kWhite,
                    brightness: Brightness.light),
                child: SfCalendar(
                    minDate: DateTime.now().subtract(Duration(hours: 1)),
                    maxDate: DateTime.now(),
                    onSelectionChanged: (_) {},
                    selectionDecoration: null,
                    initialDisplayDate: DateTime.now().subtract(2.hours),
                    viewHeaderHeight: 0,
                    headerHeight: 0,
                    appointmentBuilder: (context, appointmentDetails) {
                      final DateTime startTime =
                          appointmentDetails.appointments.first.startTime;
                      final String subject =
                          appointmentDetails.appointments.first.subject;
                      return Center(
                        child: AppointmentCard(
                          appointmentSubject: subject,
                          completed: false,
                          startTime: startTime,
                        ),
                      );
                    },
                    dataSource: _AppointmentDataSource([
                      Appointment(
                          subject: 'UpperBody Workout',
                          startTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 7, 30),
                          endTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 8, 30)),
                      Appointment(
                          subject: 'Lowerbody Workout',
                          startTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 9),
                          endTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 10)),
                      Appointment(
                          subject: 'Ab Workout',
                          startTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 20),
                          endTime: DateTime(DateTime.now().year,
                              DateTime.now().month, DateTime.now().day, 21))
                    ]),
                    timeSlotViewSettings: TimeSlotViewSettings(
                        numberOfDaysInView: 1,
                        timeRulerSize: 85.h,
                        timeIntervalWidth: 10,
                        timeFormat: 'hh:mm a',
                        timeTextStyle:
                            TextFonts().kRegular12.copyWith(color: kGrey1),
                        timeIntervalHeight: 38.h)),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: CustomFloatingProgressButton(
          value: 0,
          gradient: kPurpleLinear,
          onPressed: () {
            Get.to(
              () => const AddWorkoutSchedule(),
            );
          },
          child: Icon(
            Icons.add,
            color: kWhite,
            size: 12.w,
          )),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class NutitionStat {
  String name;
  String nutrientIcon;

  double amountDone;
  double amountRequired;
  String unit;
  NutitionStat({
    this.unit = 'g',
    required this.name,
    required this.nutrientIcon,
    required this.amountDone,
    required this.amountRequired,
  });
}

class AppointmentCard extends StatefulWidget {
  bool completed;
  final DateTime startTime;
  final String appointmentSubject;
  AppointmentCard({
    Key? key,
    required this.completed,
    required this.startTime,
    required this.appointmentSubject,
  }) : super(key: key);

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            barrierColor: kBlack.withOpacity(0.05),
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                titlePadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  width: 315.w,
                  height: 250.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r), color: kWhite),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 255.w,
                          height: 24.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('Discard');
                                },
                                child: Icon(
                                  CupertinoIcons.xmark,
                                  size: 12.w,
                                  color: kBlack,
                                ),
                              ),
                              Text(
                                'Workout Schedule',
                                style: TextFonts().kSemiBold16,
                              ),
                              LineIcon.verticalEllipsis(
                                color: kBlack,
                                size: 16.w,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        Text(
                          widget.appointmentSubject,
                          style: TextFonts().kMedium14,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.clock,
                              size: 15.42.w,
                              color: kGrey1,
                            ),
                            Text(
                              'Today | ${DateFormat.jm().format(widget.startTime)}',
                              style: TextFonts()
                                  .kRegular12
                                  .copyWith(color: kGrey1),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        DateTime.now().isAfter(widget.startTime) ||
                                widget.completed
                            ? Container(
                                width: 255.w,
                                height: 48.h,
                                decoration: BoxDecoration(
                                  color: kBorderColor,
                                  borderRadius: BorderRadius.circular(99.r),
                                ),
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.check_mark,
                                      color: kGrey1,
                                      size: 14.w,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      'Completed!',
                                      style: TextFonts()
                                          .kMedium14
                                          .copyWith(color: kGrey1),
                                    )
                                  ],
                                ),
                              )
                            : GradientButton(
                                elevation: 0,
                                increaseHeightBy: 10.h,
                                increaseWidthBy: 200.w,
                                gradient: kBlueLinear,
                                child: Text('Mark as Done',
                                    style: TextFonts()
                                        .kSemiBold12
                                        .copyWith(color: kWhite)),
                                callback: () {
                                  setState(() {
                                    widget.completed = !widget.completed;
                                  });
                                  Navigator.of(context, rootNavigator: true)
                                      .pop('Discard');
                                })
                      ],
                    ),
                  ),
                ),
              );
            });
      },
      child: Container(
        width: 184.w,
        height: 35.h,
        decoration: BoxDecoration(
            gradient:
                DateTime.now().isAfter(widget.startTime) || widget.completed
                    ? kPurpleLinear
                    : null,
            color: DateTime.now().isAfter(widget.startTime)
                ? null
                : kBorderColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(50.r)),
        child: Center(
          child: Text(
            '${widget.appointmentSubject}, ${DateFormat.jm().format(widget.startTime)}',
            style: TextFonts().kRegular12.copyWith(
                color:
                    DateTime.now().isAfter(widget.startTime) || widget.completed
                        ? kWhite
                        : kBlack),
          ),
        ),
      ),
    );
  }
}
