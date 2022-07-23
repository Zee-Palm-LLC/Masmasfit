import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/sleep_tracker/alarm_card.dart';
import 'package:masmas_fit/sleep_tracker/bedtime_card.dart';
import 'package:masmas_fit/sleep_tracker/ideal_sleep_card.dart';
import 'package:masmas_fit/sleep_tracker/percentage_sleep.dart';
import 'package:masmas_fit/sleep_tracker/time_picker.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/custom_switch.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class AddAlarm extends StatefulWidget {
  const AddAlarm({Key? key}) : super(key: key);

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  DateTime bedTime = DateTime.now();
  final DateFormat _format = DateFormat.jm();
  Duration sleepDuration = 8.hours;
  bool vibrate = false;
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
            'Add Alarm',
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
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: Get.width,
                maxHeight: Get.height -
                    MediaQuery.of(context).padding.top -
                    AppBar().preferredSize.height),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                //pick bedtime
                InkWell(
                  onTap: () async {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 216.h,
                            color: kWhite,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: bedTime,
                              // This is called when the user changes the timer duration.
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => bedTime = newDate);
                              },
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 315.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LineIcon.bed(
                            color: kGrey1,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Bedtime',
                            style:
                                TextFonts().kRegular12.copyWith(color: kGrey1),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            _format.format(bedTime),
                            style:
                                TextFonts().kRegular10.copyWith(color: kGrey2),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: kGrey2,
                            size: 20.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 216.h,
                            color: kWhite,
                            child: CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              initialTimerDuration: sleepDuration,
                              // This is called when the user changes the timer duration.
                              onTimerDurationChanged: (Duration newDuration) {
                                setState(() => sleepDuration = newDuration);
                              },
                            ),
                          );
                        });
                  },
                  child: Container(
                    width: 315.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LineIcon.clock(
                            color: kGrey1,
                            size: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Hours of Sleep',
                            style:
                                TextFonts().kRegular12.copyWith(color: kGrey1),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            '${sleepDuration.inHours}hours ${sleepDuration.inMinutes % 60}minutes',
                            style:
                                TextFonts().kRegular10.copyWith(color: kGrey2),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: kGrey2,
                            size: 20.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 315.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.repeat_rounded,
                            color: kGrey1,
                            size: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Repeat',
                            style:
                                TextFonts().kRegular12.copyWith(color: kGrey1),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            'Mon to Fri',
                            style:
                                TextFonts().kRegular10.copyWith(color: kGrey2),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            color: kGrey2,
                            size: 20.w,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 315.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        color: kBorderColor,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 13.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.vibration_rounded,
                            color: kGrey1,
                            size: 20.w,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Vibrate When Alarm Sound',
                            style:
                                TextFonts().kRegular12.copyWith(color: kGrey1),
                          ),
                          const Expanded(child: SizedBox()),
                          CustomSwitch(
                              width: 44.w,
                              height: 24.h,
                              value: vibrate,
                              onChanged: (value) {
                                setState(() {
                                  vibrate = value;
                                });
                              },
                              gradient: kPurpleLinear)
                        ],
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [kBlueShadow]),
                      child: GradientButton(
                          elevation: 0,
                          increaseHeightBy: 18.h,
                          increaseWidthBy: 300.w,
                          gradient: kBlueLinear,
                          child: Text(
                            'Add',
                            style: TextFonts().kBold16.copyWith(color: kWhite),
                          ),
                          callback: () {
                            Get.back();
                          })),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
