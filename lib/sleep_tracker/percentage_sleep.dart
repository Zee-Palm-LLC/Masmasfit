import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class PercentageSleep extends StatelessWidget {
  final Duration sleepTime;
  const PercentageSleep({required this.sleepTime, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: 315.w,
      height: 102.h,
      decoration: BoxDecoration(
        color: kPurple2.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
                textScaleFactor: tsf,
                text: TextSpan(children: [
                  TextSpan(
                      text: 'You will get ', style: TextFonts().kRegular12),
                  TextSpan(
                      text: sleepTime.inHours.toString(),
                      style: TextFonts().kSemiBold14),
                  TextSpan(text: 'hours ', style: TextFonts().kRegular12),
                  TextSpan(
                      text: (sleepTime.inMinutes % 60).toString(),
                      style: TextFonts().kSemiBold14),
                  TextSpan(text: 'minutes\n', style: TextFonts().kRegular12),
                  TextSpan(text: 'for tonight', style: TextFonts().kRegular12),
                ])),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: 275.w,
              height: 15.h,
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(99.r)),
              child: Row(
                children: [
                  Container(
                    width: getSleepPercentage(sleepTime: sleepTime) * 275.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                        gradient: kPurpleLinear,
                        borderRadius: BorderRadius.circular(99.r)),
                    child: Center(
                      child: Text(
                        '${(getSleepPercentage(sleepTime: sleepTime) * 100).floor()}%',
                        style: TextFonts().kRegular10.copyWith(color: kWhite),
                      ),
                    ),
                  ),
                  const Expanded(child: SizedBox())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

double getSleepPercentage({required Duration sleepTime}) {
  return sleepTime.inMinutes / 510;
}
