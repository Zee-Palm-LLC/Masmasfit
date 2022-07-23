// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/gradient_icon.dart';

class TodayMealCard extends StatefulWidget {
  final String mealImage;
  final String mealName;
  final DateTime mealTime;

  const TodayMealCard({
    Key? key,
    required this.mealImage,
    required this.mealName,
    required this.mealTime,
  }) : super(key: key);

  @override
  State<TodayMealCard> createState() => _TodayMealCardState();
}

class _TodayMealCardState extends State<TodayMealCard> {
  final DateFormat formatter = DateFormat.jm();
  bool activated = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 80.h,
      decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
          ),
          SvgPicture.asset(widget.mealImage),
          SizedBox(
            width: 24.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.mealName,
                style: TextFonts().kMedium14,
              ),
              Text(
                'Today | ${formatter.format(widget.mealTime)}',
                style: TextFonts().kRegular12.copyWith(color: kGrey1),
              )
            ],
          ),
          const Expanded(child: SizedBox()),
          Container(
            alignment: Alignment.center,
            width: 30.w,
            height: 30.w,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: kPurple2.withOpacity(0.1)),
            child: IconButton(
                splashRadius: 0.1,
                onPressed: () {
                  setState(() {
                    activated = !activated;
                  });
                },
                icon: activated
                    ? gradientIcon(
                        gradient: kPurpleLinear,
                        icon: Icon(CupertinoIcons.bell,
                            size: 16.w, color: kWhite))
                    : Icon(CupertinoIcons.bell_slash,
                        size: 16.w, color: kGrey2)),
          ),
          SizedBox(
            width: 15.w,
          ),
        ],
      ),
    );
  }
}
