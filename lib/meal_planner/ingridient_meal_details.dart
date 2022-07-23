// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_deatils.dart';

import 'package:masmas_fit/meal_planner/meal_schedule.dart';
import 'package:masmas_fit/text_fonts.dart';

class IngredientMealDetails extends StatefulWidget {
  final List<IngredientModel> ingredients;
  const IngredientMealDetails({
    Key? key,
    required this.ingredients,
  }) : super(key: key);

  @override
  State<IngredientMealDetails> createState() => _IngredientMealDetailsState();
}

class _IngredientMealDetailsState extends State<IngredientMealDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: 130.h,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          itemBuilder: (context, index) {
            return Center(
              child: SingleIngredientBlock(
                ingredient: widget.ingredients[index],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
                width: 15.w,
              ),
          itemCount: widget.ingredients.length),
    );
  }
}

class SingleIngredientBlock extends StatelessWidget {
  final IngredientModel ingredient;
  const SingleIngredientBlock({
    Key? key,
    required this.ingredient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 130.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
                color: kBorderColor, borderRadius: BorderRadius.circular(12.r)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: SvgPicture.asset(
                ingredient.ingredienntIcon,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(ingredient.ingredientName, style: TextFonts().kRegular12),
          Text(
            '${ingredient.quantity.round()}${ingredient.unit}',
            style: TextFonts().kRegular10.copyWith(color: kGrey1),
          )
        ],
      ),
    );
  }
}
