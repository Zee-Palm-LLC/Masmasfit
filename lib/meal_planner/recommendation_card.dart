// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_deatils.dart';
import 'package:masmas_fit/text_fonts.dart';

class RecommendationCard extends StatelessWidget {
  final Color color;
  final String difficultyRating;
  final int calories;
  final String mealIamge;
  final String mealName;
  final Duration timeNeeded;
  const RecommendationCard({
    Key? key,
    required this.color,
    required this.difficultyRating,
    required this.calories,
    required this.mealIamge,
    required this.mealName,
    required this.timeNeeded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 239.h,
      width: 200.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: color.withOpacity(0.3)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Hero(
            tag: 'recommendation-$mealName',
            child: Material(
              color: Colors.transparent,
              child: SizedBox(
                  height: 80.h,
                  width: 180.w,
                  child: SvgPicture.asset(
                    mealIamge,
                    fit: BoxFit.fitHeight,
                  )),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            mealName,
            style: TextFonts().kMedium14,
          ),
          Text(
            '$difficultyRating | ${durationFormatter(timeNeeded)} | ${calories}kCal',
            style: TextFonts().kRegular12.copyWith(color: kGrey1),
          ),
          SizedBox(
            height: 15.h,
          ),
          GradientButton(
            elevation: 0,
            gradient: kBlueLinear,
            callback: () {
              Get.to(() => MealDetails(
                  mealName: mealName,
                  mealImage: mealIamge,
                  heroTag: 'recommendation-$mealName',
                  backgroundGradient:
                      color == kBlue2 ? kBlueLinear : kPurpleLinear,
                  backgroundColor: color));
            },
            increaseWidthBy: 20.w,
            child: Text(
              'View',
              style: TextFonts().kSemiBold12.copyWith(color: kWhite),
            ),
          )
        ],
      ),
    );
  }

  String durationFormatter(Duration duration) {
    if (duration.inHours < 1) {
      return '${duration.inMinutes}mins';
    } else if (duration.inHours == 1) {
      return '1hr${duration.inMinutes}mins';
    } else {
      return '${duration.inHours}hrs${duration.inMinutes % 60}mins';
    }
  }
}
