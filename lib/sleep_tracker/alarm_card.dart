import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/custom_switch.dart';

class AlarmCard extends StatefulWidget {
  bool activate;
  DateTime bedTime;
  AlarmCard({
    Key? key,
    required this.activate,
    required this.bedTime,
  }) : super(key: key);

  @override
  State<AlarmCard> createState() => _AlarmCardState();
}

class _AlarmCardState extends State<AlarmCard> {
  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: 315.w,
      height: 93.h,
      decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [kCardShadow]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 31.h),
            child: SizedBox(
              height: 30.w,
              width: 30.w,
              child: SvgPicture.asset(
                Assets().kAlarmIcon,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  textScaleFactor: tsf,
                  text: TextSpan(children: [
                    TextSpan(text: 'Alarm, ', style: TextFonts().kMedium14),
                    TextSpan(
                        text:
                            '${(widget.bedTime.hour).toString()}:${(widget.bedTime.minute).toString()}pm',
                        style: TextFonts().kRegular12.copyWith(color: kGrey1))
                  ])),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'in ${timeDifference(toTime: widget.bedTime)}',
                style: TextFonts().kMedium16.copyWith(color: kGrey1),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.only(right: 15.w, top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                LineIcon.verticalEllipsis(
                  color: kGrey2,
                  size: 14.w,
                ),
                SizedBox(
                  height: 15.h,
                ),
                CustomSwitch(
                    borderRadius: 50.r,
                    width: 44.w,
                    height: 25.h,
                    inactiveColor: kGrey2.withOpacity(0.2),
                    value: widget.activate,
                    onChanged: (value) {
                      setState(() {
                        widget.activate = value;
                      });
                    },
                    gradient: kPurpleLinear)
              ],
            ),
          )
        ],
      ),
    );
  }

  String timeDifference({required DateTime toTime}) {
    DateTime currentTime = DateTime.now();
    Duration difference = toTime.difference(currentTime);
    return '${(difference.inHours).toString()}hours ${(difference.inMinutes % 60).toString()}minutes';
  }
}
