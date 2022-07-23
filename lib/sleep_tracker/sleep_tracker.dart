import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
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

class SleepTracker extends StatefulWidget {
  const SleepTracker({Key? key}) : super(key: key);

  @override
  State<SleepTracker> createState() => _SleepTrackerState();
}

class _SleepTrackerState extends State<SleepTracker> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWrapper(
      backgroundColor: kWhite,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 62.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 30.0.w),
            child: Center(child: backButtonGrey(null)),
          ),
          title: Text(
            'Sleep Tracker',
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
          child: Container(
            constraints:
                BoxConstraints(maxWidth: Get.width, maxHeight: Get.height),
            child: Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  const SleepChart(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const LastNightSleepCard(),
                  SizedBox(
                    height: 30.h,
                  ),
                  const CheckSleepScheduleCard(),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Today Schedule',
                    style: TextFonts().kSemiBold16,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  BedtimeCard(
                      activate: true,
                      bedTime: (DateTime.now()
                          .add(const Duration(hours: 6, minutes: 22)))),
                  SizedBox(
                    height: 15.h,
                  ),
                  AlarmCard(
                      activate: false,
                      bedTime: DateTime.now()
                          .add(const Duration(hours: 14, minutes: 30))),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
