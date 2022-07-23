import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_deatils.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/gradient_icon.dart';

class PopularCard extends StatelessWidget {
  final String difficultyRating;
  final int calories;
  final String mealIamge;
  final String mealName;
  final Duration timeNeeded;
  const PopularCard(
      {required this.mealName,
      required this.mealIamge,
      required this.difficultyRating,
      required this.calories,
      required this.timeNeeded,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 80.h,
      decoration: BoxDecoration(
          boxShadow: [kCardShadow],
          color: kWhite,
          borderRadius: BorderRadius.circular(16.r)),
      child: Row(
        children: [
          SizedBox(
            width: 18.w,
          ),
          Hero(
            tag: 'popular-$mealName',
            child: Material(
              color: Colors.transparent,
              child: SizedBox(
                height: 50.w,
                width: 50.w,
                child: SvgPicture.asset(
                  mealIamge,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 18.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 17.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  mealName,
                  style: TextFonts().kMedium14,
                ),
                Text(
                  '$difficultyRating | ${durationFormatter(timeNeeded)} | ${calories}kCal',
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
                  heroTag: 'popular-$mealName',
                  backgroundGradient: kBlueLinear,
                  backgroundColor: kBlue2));
            },
            child: gradientIcon(
                gradient: kPurpleLinear,
                icon: LineIcon.chevronCircleRight(
                  color: kWhite,
                  size: 27.w,
                )),
          ),
          SizedBox(
            width: 15.w,
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
