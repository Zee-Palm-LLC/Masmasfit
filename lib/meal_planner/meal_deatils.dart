// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/ingridient_meal_details.dart';
import 'package:masmas_fit/meal_planner/meal_schedule.dart';
import 'package:masmas_fit/meal_planner/nutirition_meal_details.dart';
import 'package:masmas_fit/meal_planner/recipe_step.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/like_button.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:path/path.dart';

class MealDetails extends StatefulWidget {
  final String mealName;
  final String mealImage;
  final String heroTag;
  final LinearGradient backgroundGradient;
  final Color backgroundColor;
  const MealDetails({
    Key? key,
    required this.mealName,
    required this.mealImage,
    required this.heroTag,
    required this.backgroundGradient,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  State<MealDetails> createState() => _MealDetailsState();
}

class _MealDetailsState extends State<MealDetails> {
  bool liked = false;
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      // appBar: AppBar(
      //   systemOverlayStyle: const SystemUiOverlayStyle(
      //       statusBarColor: Colors.transparent,
      //       statusBarIconBrightness: Brightness.dark),
      //   // leadingWidth: 62.w,
      //   // leading: Padding(
      //   //   padding: EdgeInsets.only(left: 30.0.w),
      //   //   child: Center(child: backButtonGrey(null)),
      //   // ),
      //   // title: Text(
      //   //   'Meal Schedule',
      //   //   style: TextFonts().kBold16,
      //   // ),
      //   // centerTitle: true,
      //   // actions: [
      //   //   Padding(
      //   //     padding: EdgeInsets.only(right: 30.w),
      //   //     child: Center(child: optionButton(null, () {})),
      //   //   )
      //   // ],

      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: Get.height,
          width: Get.width,
          child: Stack(children: [
            Hero(
              tag: widget.heroTag,
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  padding: EdgeInsets.only(bottom: 20.h),
                  width: Get.width,
                  height: 450.h,
                  decoration:
                      BoxDecoration(gradient: widget.backgroundGradient),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: 288.w,
                          height: 288.w,
                          decoration: BoxDecoration(
                            color: kWhite.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: 288.w,
                          height: 288.w,
                          child: SvgPicture.asset(
                            widget.mealImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.r),
                      topRight: Radius.circular(50.r),
                    )),
                width: Get.width,
                child: DraggableScrollableSheet(
                    initialChildSize: 0.6,
                    maxChildSize: 0.875,
                    minChildSize: 0.5,
                    expand: false,
                    builder: (context, scrollContainer) {
                      return Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: ListView(
                          controller: scrollContainer,
                          padding: EdgeInsets.only(top: 15.h),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 162.w),
                              child: Container(
                                width: 50.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                    color: kBlack.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(50.r)),
                              ),
                            ),
                            SizedBox(
                              height: 25.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: SizedBox(
                                width: 315.w,
                                height: 50.h,
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.mealName,
                                          style: TextFonts().kBold16,
                                        ),
                                        RichText(
                                            textScaleFactor: tsf,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text: 'by ',
                                                  style: TextFonts()
                                                      .kRegular12
                                                      .copyWith(color: kGrey1)),
                                              TextSpan(
                                                  text: 'Bofa Deez',
                                                  style: TextFonts()
                                                      .kRegular12
                                                      .copyWith(color: kBlue2))
                                            ]))
                                      ],
                                    ),
                                    const Expanded(child: SizedBox()),
                                    LikeButtonn(
                                        liked: liked,
                                        changeLike: () => setState(() {
                                              liked = !liked;
                                            }))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0.w),
                              child: Text(
                                'Nutrition',
                                style: TextFonts().kSemiBold16,
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            NutritionMealDetails(stats: mealNutiritions),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 30.w),
                                child: Text('Descriptions',
                                    style: TextFonts().kSemiBold16)),
                            SizedBox(
                              height: 15.h,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0.w),
                              child: SizedBox(
                                  width: 315.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                          "Pancakes are some people's favorite breakfast, who doesn't like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being very delicious and Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                          maxLines: readMore ? 10 : 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextFonts()
                                              .kRegular10
                                              .copyWith(color: kGrey1)),
                                      InkWell(
                                        onTap: () => setState(
                                            () => readMore = !readMore),
                                        child: GradientText(
                                          readMore
                                              ? 'Read less...'
                                              : 'Read more...',
                                          style: TextFonts().kMedium12,
                                          gradient: kBlueLinear,
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: SizedBox(
                                width: 315.w,
                                height: 50.h,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                        height: 50.h,
                                        width: 170.w,
                                        child: Text(
                                          'Ingredients That You Will Need',
                                          style: TextFonts().kSemiBold16,
                                        )),
                                    const Expanded(child: SizedBox()),
                                    Text(
                                      '${ingredients.length} items',
                                      style: TextFonts()
                                          .kRegular12
                                          .copyWith(color: kGrey1),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            IngredientMealDetails(ingredients: ingredients),
                            SizedBox(
                              height: 30.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                              child: SizedBox(
                                height: 25.h,
                                width: 315.w,
                                child: Row(children: [
                                  Text(
                                    'Step by Step',
                                    style: TextFonts().kSemiBold16,
                                  ),
                                  const Expanded(child: SizedBox()),
                                  Text(
                                    '${steps.length} Steps',
                                    style: TextFonts()
                                        .kRegular12
                                        .copyWith(color: kGrey1),
                                  )
                                ]),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            IllustratedSteps(
                              steps: steps,
                            ),
                            SizedBox(
                              height: 75.h,
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50.0.h),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  width: 315.w,
                  height: 32.h,
                  child: Row(
                    children: [
                      backButtonGrey(null),
                      const Expanded(child: SizedBox()),
                      optionButton(null, () {})
                    ],
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: Container(
        width: 315.w,
        height: 54.h,
        decoration: BoxDecoration(boxShadow: [kBlueShadow]),
        child: RawMaterialButton(
            padding: EdgeInsets.only(right: 30.w),
            child: GradientButton(
                gradient: kBlueLinear,
                increaseHeightBy: 18.h,
                increaseWidthBy: 250.w,
                child: Text(
                  'Add Breakfast Meal',
                  style: TextFonts().kBold16.copyWith(color: kWhite),
                ),
                callback: () {}),
            onPressed: () {}),
      ),
    );
  }

  List<IngredientModel> ingredients = [
    IngredientModel(
        ingredientName: 'Wheat Flour',
        ingredienntIcon: Assets().kWheatFlour,
        quantity: 100,
        unit: 'g'),
    IngredientModel(
        ingredientName: 'Sugar',
        ingredienntIcon: Assets().kSugar,
        quantity: 3,
        unit: 'tbsp'),
    IngredientModel(
        ingredientName: 'Baking Soda',
        ingredienntIcon: Assets().kBakingSoda,
        quantity: 2,
        unit: 'tbsp'),
    IngredientModel(
        ingredientName: 'Eggs',
        ingredienntIcon: Assets().kEggs,
        quantity: 2,
        unit: '')
  ];
  List<NutitionStat> mealNutiritions = [
    NutitionStat(
        name: 'Calories',
        unit: 'kCal',
        nutrientIcon: Assets().kCaloriesIcon,
        amountDone: 320,
        amountRequired: 500),
    NutitionStat(
        name: 'Proteins',
        nutrientIcon: Assets().kProteinIcon,
        amountDone: 300,
        amountRequired: 900),
    NutitionStat(
        name: 'Fats',
        nutrientIcon: Assets().kFatIcon,
        amountDone: 200,
        amountRequired: 500),
    NutitionStat(
        name: 'Carbs',
        nutrientIcon: Assets().kCarbIcon,
        amountDone: 100,
        amountRequired: 900)
  ];
  List<String> steps = [
    'Prepare all of the ingredients that needed',
    'Mix flour, sugar, salt, and baking powder',
    'In a seperate place, mix the eggs and liquid milk until blended',
    'Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth',
    'Prepare all of the ingredients that needed',
    'Mix flour, sugar, salt, and baking powder',
    'In a seperate place, mix the eggs and liquid milk until blended',
    'Put the egg and milk mixture into the dry ingredients, Stir untul smooth and smooth',
  ];
}

class IngredientModel {
  String ingredientName;
  String ingredienntIcon;
  double quantity;
  String unit;
  IngredientModel({
    required this.ingredientName,
    required this.ingredienntIcon,
    required this.quantity,
    required this.unit,
  });
}
