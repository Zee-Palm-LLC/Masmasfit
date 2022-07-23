import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/sleep_tracker/sleep_schedule.dart';
import 'package:masmas_fit/text_fonts.dart';

class CheckSleepScheduleCard extends StatelessWidget {
  const CheckSleepScheduleCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 57.h,
      decoration: BoxDecoration(
          color: kBlue2.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(children: [
        SizedBox(
          width: 20.w,
        ),
        Text(
          'Daily Sleep Schedule',
          style: TextFonts().kMedium14,
        ),
        const Expanded(child: SizedBox()),
        SizedBox(
            width: 68.w,
            height: 28.h,
            child: GradientButton(
                elevation: 0,
                gradient: kBlueLinear,
                child: Text('Check',
                    style: TextFonts().kRegular12.copyWith(color: kWhite)),
                callback: () {
                  Get.to(() => const SleepSchedule(),
                      transition: Transition.cupertino);
                })),
        SizedBox(
          width: 20.w,
        ),
      ]),
    );
  }
}
