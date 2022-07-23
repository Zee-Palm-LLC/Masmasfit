// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/category_card.dart';
import 'package:masmas_fit/meal_planner/meal_chart.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_box.dart';
import 'package:masmas_fit/meal_planner/meal_time_dropdown.dart';
import 'package:masmas_fit/meal_planner/meal_type_card.dart';
import 'package:masmas_fit/meal_planner/popular_card.dart';
import 'package:masmas_fit/meal_planner/recommendation_card.dart';
import 'package:masmas_fit/meal_planner/time_dropdown.dart';
import 'package:masmas_fit/meal_planner/today_meal_card.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/gradient_icon.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class CategoryMealsView extends StatefulWidget {
  final String category;

  const CategoryMealsView({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<CategoryMealsView> createState() => CategoryMealsViewState();
}

class CategoryMealsViewState extends State<CategoryMealsView> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          leadingWidth: 62.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 30.0.w),
            child: Center(child: backButtonGrey(null)),
          ),
          title: Text(
            widget.category,
            style: TextFonts().kBold16,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Center(child: optionButton(null, () {})),
            )
          ],
          backgroundColor: kWhite,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 33.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  //search
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: 315.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [kCardShadow]),
                      child: TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '|',
                                  style: TextFonts()
                                      .kRegular16
                                      .copyWith(color: kGrey3),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                gradientIcon(
                                    icon: SvgPicture.asset(
                                  Assets().kMealSearchFilter,
                                  color: kWhite,
                                  width: 12.w,
                                  height: 12.w,
                                ))
                              ],
                            ),
                            hintText: 'Search Pancake',
                            hintStyle:
                                TextFonts().kRegular12.copyWith(color: kGrey3),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 15.h),
                            prefixIcon: Icon(
                              CupertinoIcons.search,
                              color: kGrey2,
                              size: 20.w,
                            )),
                      ),
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Category',
                  style: TextFonts().kSemiBold16,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 110.h,
                width: Get.width,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    itemBuilder: ((context, index) => Center(
                          child: CategoryCard(
                              category: categories[index].categoryName,
                              iconPath: categories[index].categoryIcon,
                              color: index % 2 == 0 ? kBlue2 : kPurple2),
                        )),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 15.w,
                        ),
                    itemCount: categories.length),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0.w, top: 30.h),
                child: SizedBox(
                  width: 149.w,
                  child: Text(
                    'Recommendation for Diet',
                    style: TextFonts().kSemiBold16,
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: Get.width,
                height: 250.h,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    itemBuilder: (context, index) => Center(
                          child: RecommendationCard(
                              color: index % 2 == 0 ? kBlue2 : kPurple2,
                              difficultyRating:
                                  recommendations[index].difficultyRating,
                              calories: recommendations[index].calories,
                              mealIamge: recommendations[index].mealIamge,
                              mealName: recommendations[index].mealName,
                              timeNeeded: recommendations[index].timeNeeded),
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 15.w,
                        ),
                    itemCount: recommendations.length),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Popular',
                  style: TextFonts().kSemiBold16,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.separated(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  itemBuilder: (context, index) => Center(
                        child: PopularCard(
                            difficultyRating:
                                recommendations[index].difficultyRating,
                            calories: recommendations[index].calories,
                            mealIamge: recommendations[index].mealIamge,
                            mealName: recommendations[index].mealName,
                            timeNeeded: recommendations[index].timeNeeded),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 15.w,
                      ),
                  itemCount: recommendations.length),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ));
  }

  List<CategoryCardData> categories = [
    CategoryCardData(categoryName: 'Salad', categoryIcon: Assets().kSalad),
    CategoryCardData(categoryName: 'Cake', categoryIcon: Assets().kPancake),
    CategoryCardData(categoryName: 'Pie', categoryIcon: Assets().kPie),
    CategoryCardData(categoryName: 'Smoothie', categoryIcon: Assets().kOrange),
    CategoryCardData(categoryName: 'Coffee', categoryIcon: Assets().kCoffee),
    CategoryCardData(
        categoryName: 'Chicken', categoryIcon: Assets().kChickenSteak)
  ];
  List<RecommendedMealItem> recommendations = [
    RecommendedMealItem(
        difficultyRating: 'Easy',
        calories: 180,
        mealIamge: Assets().kPancake,
        mealName: 'Honey Pancake',
        timeNeeded: 30.minutes),
    RecommendedMealItem(
        difficultyRating: 'Medium',
        calories: 120,
        mealIamge: Assets().kNigiri,
        mealName: 'Salmon Nigiri',
        timeNeeded: 20.minutes),
    RecommendedMealItem(
        difficultyRating: 'Hard',
        calories: 300,
        mealIamge: Assets().kChickenSteak,
        mealName: 'Beef Steak',
        timeNeeded: 1.hours + 20.minutes),
    RecommendedMealItem(
        difficultyRating: 'Medium',
        calories: 20,
        mealIamge: Assets().kCoffee,
        mealName: 'Black Coffee',
        timeNeeded: 10.minutes)
  ];
}

class CategoryCardData {
  String categoryName;
  String categoryIcon;

  CategoryCardData({
    required this.categoryName,
    required this.categoryIcon,
  });
}

class RecommendedMealItem {
  String difficultyRating;
  int calories;
  String mealIamge;
  String mealName;
  Duration timeNeeded;
  RecommendedMealItem({
    required this.difficultyRating,
    required this.calories,
    required this.mealIamge,
    required this.mealName,
    required this.timeNeeded,
  });
}
