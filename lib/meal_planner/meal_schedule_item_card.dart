import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_deatils.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/gradient_icon.dart';

class MealScheduleItemCard extends StatelessWidget {
  final DateFormat formatter = DateFormat.jm();
  final String mealIamge;
  final String mealName;
  final DateTime mealTime;
  final Color color;
  MealScheduleItemCard(
      {required this.mealName,
      required this.mealIamge,
      required this.mealTime,
      required this.color,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 65.h,
      color: kWhite,
      child: Row(
        children: [
          Hero(
            tag: 'schedule-$mealTime-$mealName',
            child: Material(
              color: Colors.transparent,
              child: Container(
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                    color: color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12.r)),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: SvgPicture.asset(
                  mealIamge,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 9.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mealName,
                  style: TextFonts().kMedium14,
                ),
                Text(
                  formatter.format(mealTime),
                  style: TextFonts().kRegular12.copyWith(color: kGrey1),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: () {
              Get.to(() => MealDetails(
                  mealName: mealName,
                  mealImage: mealIamge,
                  heroTag: 'schedule-$mealTime-$mealName',
                  backgroundGradient:
                      color == kBlue2 ? kBlueLinear : kPurpleLinear,
                  backgroundColor: color));
            },
            child: LineIcon.chevronCircleRight(
              color: kGrey2,
              size: 24.w,
            ),
          )
        ],
      ),
    );
  }
}
