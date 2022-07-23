// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/today_target_card.dart';
import 'package:masmas_fit/meal_planner/time_dropdown.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class ActivityTracker extends StatefulWidget {
  const ActivityTracker({Key? key}) : super(key: key);

  @override
  State<ActivityTracker> createState() => _ActivityTrackerState();
}

class _ActivityTrackerState extends State<ActivityTracker> {
  String dropdownValue = 'Weekly';

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
            'Activity Tracker',
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
        body: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    TodayTargetCard(),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 315.w,
                      height: 30.h,
                      child: Row(
                        children: [
                          Text(
                            'Activity Progress',
                            style: TextFonts().kSemiBold16,
                          ),
                          const Expanded(child: SizedBox()),
                          TimeDropdown(
                            dropdownValue: dropdownValue,
                            stateFunction: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      width: 315.w,
                      height: 200.h,
                      decoration: BoxDecoration(
                          boxShadow: [kCardShadow],
                          borderRadius: BorderRadius.circular(20.r),
                          color: kWhite),
                      child: Center(
                        child: ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: apBarData.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              width: 20.w,
                            );
                          },
                          itemBuilder: (BuildContext context, int index) {
                            return Center(
                              child: VerticalProgressBar(
                                  gradient: index % 2 == 0
                                      ? kBlueLinear
                                      : kPurpleLinear,
                                  percentage: apBarData[index].percantage,
                                  day: dropdownValue == 'Weekly'
                                      ? apBarData[index].day
                                      : apBarData[index].month),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    SizedBox(
                      width: 315.w,
                      height: 30.h,
                      child: Row(
                        children: [
                          Text(
                            'Latest Activity',
                            style: TextFonts().kSemiBold16,
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'See more',
                            style:
                                TextFonts().kMedium12.copyWith(color: kGrey2),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: activities.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: ActivityCard(
                              notifImage: activities[index].notifImage,
                              notif: activities[index].notif,
                              timeAgo: activities[index].timeAgo,
                              color: index % 2 == 0 ? kBlue2 : kPurple2),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ]),
            ),
          ),
        ));
  }

  List<ActivityProgressBarData> apBarData = [
    ActivityProgressBarData(
        month: DateFormat.MMM().format(DateTime.now()),
        day: 'Sun',
        percantage: Random().nextDouble() * 80 + 20),
    ActivityProgressBarData(
        month: DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month - 1)),
        day: 'Mon',
        percantage: Random().nextDouble() * 80 + 20),
    ActivityProgressBarData(
        month: DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month - 2)),
        day: 'Tue',
        percantage: Random().nextDouble() * 80 + 20),
    ActivityProgressBarData(
        month: DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month - 3)),
        day: 'Wed',
        percantage: Random().nextDouble() * 80 + 20),
    ActivityProgressBarData(
        month: DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month - 4)),
        day: 'Thu',
        percantage: Random().nextDouble() * 80 + 20),
    ActivityProgressBarData(
        month: DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month - 5)),
        day: 'Fri',
        percantage: Random().nextDouble() * 80 + 20),
    ActivityProgressBarData(
        month: DateFormat.MMM()
            .format(DateTime(DateTime.now().year, DateTime.now().month - 6)),
        day: 'Sat',
        percantage: Random().nextDouble() * 80 + 20)
  ];
  List<NotificationModel> activities = [
    NotificationModel(
        notifImage: Assets().kAcitivityDrinkWater,
        notif: 'Drinking 300ml Water',
        timeAgo: 'About 1 minutes ago'),
    NotificationModel(
        notifImage: Assets().kAcitivityEatSnack,
        notif: "Eat Snack (Fitbar)",
        timeAgo: 'About 3 hours ago'),
    NotificationModel(
        notifImage: Assets().kAcitivityEatSnack,
        notif: "Ate Meal (Breakfast)",
        timeAgo: "About 3 hours ago"),
    NotificationModel(
        notifImage: Assets().kAcitivityDrinkWater,
        notif: "Completed Workout (Upper Body)",
        timeAgo: '29 May')
  ];
}

class ActivityProgressBarData {
  final String day;
  final String month;
  final double percantage;
  ActivityProgressBarData({
    required this.day,
    required this.month,
    required this.percantage,
  });
}

class NotificationModel {
  final String notifImage;
  final String notif;
  final String timeAgo;
  NotificationModel({
    required this.notifImage,
    required this.notif,
    required this.timeAgo,
  });
}

class VerticalProgressBar extends StatelessWidget {
  final LinearGradient gradient;
  final double percentage;
  final String day;
  const VerticalProgressBar({
    Key? key,
    required this.gradient,
    required this.percentage,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 22.w,
          height: 135.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: kBorderColor,
          ),
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 22.w,
            height: (percentage / 100) * 135.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r), gradient: gradient),
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          day,
          style: TextFonts().kRegular12.copyWith(color: kGrey1),
        )
      ],
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String notifImage;
  final String notif;
  final String timeAgo;
  final Color color;
  const ActivityCard({
    Key? key,
    required this.notifImage,
    required this.notif,
    required this.timeAgo,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 80.h,
      decoration: BoxDecoration(
          boxShadow: [kCardShadow],
          borderRadius: BorderRadiusDirectional.circular(16.r),
          color: kWhite),
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: color.withOpacity(0.3)),
              width: 50.w,
              height: 50.w,
              child: SvgPicture.asset(
                notifImage,
                fit: BoxFit.contain,
              )),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notif,
                style: TextFonts().kMedium12,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(timeAgo,
                  style: TextFonts().kRegular10.copyWith(color: kGrey1))
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(bottom: 32.5.w),
            child: Icon(
              CupertinoIcons.ellipsis_vertical,
              size: 14.w,
              color: kGrey2,
            ),
          )
        ],
      ),
    );
  }
}
