// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/category_meals_view.dart';
import 'package:masmas_fit/text_fonts.dart';

class MealTypeCard extends StatelessWidget {
  final Color cardColor;
  final LinearGradient buttonGradient;
  final String mealType;
  final int mealCount;
  const MealTypeCard({
    Key? key,
    required this.cardColor,
    required this.buttonGradient,
    required this.mealType,
    required this.mealCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 180.w,
        width: 180.w,
        child: Container(
          width: 180.w,
          height: 180.w,
          decoration: BoxDecoration(
            color: cardColor.withOpacity(0.3),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(100.r),
                topLeft: Radius.circular(22.r),
                bottomLeft: Radius.circular(22.r),
                bottomRight: Radius.circular(22.r)),
          ),
          child: Stack(children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0.w, bottom: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealType,
                    style: TextFonts().kMedium14,
                  ),
                  Text(
                    '$mealCount+ foods',
                    style: TextFonts().kRegular12.copyWith(color: kGrey1),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 60.0.w),
                    child: GradientButton(
                        increaseWidthBy: 30.w,
                        elevation: 0,
                        shapeRadius: BorderRadius.circular(50.r),
                        gradient: buttonGradient,
                        child: Text(
                          'Select',
                          style:
                              TextFonts().kSemiBold12.copyWith(color: kWhite),
                        ),
                        callback: () {
                          Get.to(() => CategoryMealsView(category: mealType),
                              transition: Transition.cupertino);
                        }),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 120.w,
                height: 75.h,
                child: SvgPicture.asset(
                  Assets().kPie,
                  fit: BoxFit.contain,
                ),
              ),
            )
          ]),
        ));
  }
}
