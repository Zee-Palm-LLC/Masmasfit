// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/colors.dart';

import 'package:masmas_fit/meal_planner/meal_schedule.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_item_card.dart';

import 'package:masmas_fit/text_fonts.dart';

class MealScheduleMeal extends StatelessWidget {
  final MealScheduleItem schedule;
  const MealScheduleMeal({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 315.w,
            height: 30.h,
            child: Row(
              children: [
                Text(
                  schedule.mealTime,
                  style: TextFonts().kSemiBold16,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '${schedule.meals.length} meals | ${schedule.calories} calories',
                  style: TextFonts().kRegular12.copyWith(color: kGrey2),
                )
              ],
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: schedule.meals.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return MealScheduleItemCard(
                  mealName: schedule.meals[index].mealName,
                  mealIamge: schedule.meals[index].mealIamge,
                  mealTime: schedule.meals[index].mealTime,
                  color: index % 2 == 0 ? kBlue2 : kPurple2);
            },
          ),
        ],
      ),
    );
  }
}
