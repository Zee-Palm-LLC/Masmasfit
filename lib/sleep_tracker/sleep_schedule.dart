import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/sleep_tracker/add_alarm.dart';
import 'package:masmas_fit/sleep_tracker/alarm_card.dart';
import 'package:masmas_fit/sleep_tracker/bedtime_card.dart';
import 'package:masmas_fit/sleep_tracker/ideal_sleep_card.dart';
import 'package:masmas_fit/sleep_tracker/percentage_sleep.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class SleepSchedule extends StatefulWidget {
  const SleepSchedule({Key? key}) : super(key: key);

  @override
  State<SleepSchedule> createState() => _SleepScheduleState();
}

class _SleepScheduleState extends State<SleepSchedule> {
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
      ScrollController(initialScrollOffset: 60.w * 6 + 30.w);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 62.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 30.0.w),
            child: Center(child: backButtonGrey(null)),
          ),
          title: Text(
            'Sleep Schedule',
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
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
              child: const IdealSleepCard(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0.w),
              child: Text(
                'Your Schedule',
                style: TextFonts().kSemiBold16,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
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
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: BedtimeCard(
                  activate: true,
                  bedTime: DateTime.now()
                      .add(const Duration(hours: 6, minutes: 24))),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: AlarmCard(
                  activate: true,
                  bedTime: DateTime.now()
                      .add(const Duration(hours: 14, minutes: 30))),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: PercentageSleep(
                  sleepTime: const Duration(hours: 7, minutes: 10)),
            )
          ],
        )),
        floatingActionButton: CustomFloatingProgressButton(
            value: 0,
            gradient: kPurpleLinear,
            onPressed: () {
              Get.to(() => const AddAlarm(), transition: Transition.cupertino);
            },
            child: Icon(
              Icons.add,
              color: kWhite,
              size: 12.w,
            )),
      ),
    );
  }
}

Widget dateCard(DateTime now, bool active) {
  return Container(
    width: 60.w,
    height: 80.h,
    decoration: BoxDecoration(
        color: active ? null : kBorderColor,
        gradient: active ? kBlueLinear : null,
        borderRadius: BorderRadius.circular(10.r)),
    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        nameOfTheDay(weekday: now.weekday),
        style: TextFonts().kRegular12.copyWith(color: active ? kWhite : kBlack),
      ),
      SizedBox(
        height: 5.h,
      ),
      Text(
        now.day.toString(),
        style: TextFonts().kMedium14.copyWith(color: active ? kWhite : kBlack),
      ),
    ]),
  );
}

String nameOfTheDay({required int weekday}) {
  switch (weekday) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thurs';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return '';
  }
}
