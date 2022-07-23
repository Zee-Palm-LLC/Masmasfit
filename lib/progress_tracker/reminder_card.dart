import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class ReminderCard extends StatefulWidget {
  const ReminderCard({Key? key}) : super(key: key);

  @override
  State<ReminderCard> createState() => _ReminderCardState();
}

class _ReminderCardState extends State<ReminderCard> {
  DateTime nextDate = DateTime.now().add(const Duration(days: 10));
  bool closed = false;
  @override
  Widget build(BuildContext context) {
    return closed
        ? const SizedBox()
        : Container(
            width: 315.w,
            height: 90.h,
            decoration: BoxDecoration(
                color: kDanger.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.r)),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15.w, 15.h, 0, 15.w),
              child: Row(
                children: [
                  Container(
                    height: 60.w,
                    width: 60.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kWhite.withOpacity(0.5)),
                    child: Center(
                        child: SvgPicture.asset(
                      Assets().kRemindersIcon,
                      fit: BoxFit.contain,
                    )),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reminder!',
                        style: TextFonts().kRegular12.copyWith(color: kDanger),
                      ),
                      Text(
                        'Next Photos Fall On ${getMonthName(nextDate.month)} ${nextDate.day}',
                        style: TextFonts().kMedium14,
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: EdgeInsets.only(bottom: 34.h),
                    child: IconButton(
                        splashRadius: 0.1,
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            closed = true;
                          });
                        },
                        iconSize: 16.w,
                        icon: Icon(
                          Icons.clear_rounded,
                          color: kGrey1,
                        )),
                  )
                ],
              ),
            ),
          );
  }
}
