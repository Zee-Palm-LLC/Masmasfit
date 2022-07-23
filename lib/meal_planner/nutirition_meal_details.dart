// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';

import 'package:masmas_fit/meal_planner/meal_schedule.dart';
import 'package:masmas_fit/text_fonts.dart';

class NutritionMealDetails extends StatefulWidget {
  final List<NutitionStat> stats;
  const NutritionMealDetails({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  State<NutritionMealDetails> createState() => _NutritionMealDetailsState();
}

class _NutritionMealDetailsState extends State<NutritionMealDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 40.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          itemBuilder: (context, index) {
            return Center(
              child: SingleNutritionStatBlock(
                stats: widget.stats[index],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 15.w,
              ),
          itemCount: widget.stats.length),
    );
  }
}

class SingleNutritionStatBlock extends StatelessWidget {
  final NutitionStat stats;
  const SingleNutritionStatBlock({
    Key? key,
    required this.stats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return Container(
      constraints: BoxConstraints(maxWidth: 120.w),
      height: 38.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: kBlue2.withOpacity(0.2)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 18.w,
              height: 18.w,
              child: SvgPicture.asset(
                stats.nutrientIcon,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            RichText(
                textScaleFactor: tsf,
                text: TextSpan(children: [
                  TextSpan(
                      text: '${stats.amountDone.round()}',
                      style: TextFonts().kRegular10),
                  TextSpan(text: stats.unit, style: TextFonts().kRegular10),
                  TextSpan(
                      text: stats.unit == 'g' ? ' ${stats.name}' : '',
                      style: TextFonts().kRegular10)
                ]))
          ],
        ),
      ),
    );
  }
}
