// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_chart.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_box.dart';
import 'package:masmas_fit/meal_planner/meal_time_dropdown.dart';
import 'package:masmas_fit/meal_planner/meal_type_card.dart';
import 'package:masmas_fit/meal_planner/time_dropdown.dart';
import 'package:masmas_fit/meal_planner/today_meal_card.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class MealPlanner extends StatefulWidget {
  const MealPlanner({Key? key}) : super(key: key);

  @override
  State<MealPlanner> createState() => MealPlannerState();
}

class MealPlannerState extends State<MealPlanner> {
  String dropdownValue = 'Weekly';
  String mealTimeDropDown = 'Breakfast';
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
            'Meal Planner',
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
                child: SizedBox(
                  width: 315.w,
                  height: 30.h,
                  child: Row(
                    children: [
                      Text(
                        'Meal Nutritions',
                        style: TextFonts().kSemiBold16,
                      ),
                      const Expanded(child: SizedBox()),
                      TimeDropdown(
                        dropdownValue: dropdownValue,
                        stateFunction: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: const MealStatsGraph(),
              ),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: const CheckDailyMealScheduleCard(),
              ),
              SizedBox(
                height: 30.h,
              ),
              //today meals
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: SizedBox(
                  width: 315.w,
                  height: 30.h,
                  child: Row(
                    children: [
                      Text(
                        'Today Meals',
                        style: TextFonts().kSemiBold16,
                      ),
                      const Expanded(child: SizedBox()),
                      MealTimeDropdown(
                        dropdownValue: mealTimeDropDown,
                        stateFunction: (String? newValue) {
                          setState(() {
                            mealTimeDropDown = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    return Center(
                      child: TodayMealCard(
                          mealImage: mealTime(mealTime: mealTimeDropDown)[index]
                              .mealIamge,
                          mealName: mealTime(mealTime: mealTimeDropDown)[index]
                              .mealName,
                          mealTime: mealTime(mealTime: mealTimeDropDown)[index]
                              .mealTime),
                    );
                  }),
                  separatorBuilder: (context, index) => SizedBox(height: 15.h),
                  itemCount: mealTime(mealTime: mealTimeDropDown).length),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Text(
                  'Find Something to Eat',
                  style: TextFonts().kSemiBold16,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: Get.width,
                height: 200.h,
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Center(
                        child: MealTypeCard(
                            cardColor: index % 2 == 0 ? kBlue2 : kPurple2,
                            buttonGradient:
                                index % 2 == 0 ? kBlueLinear : kPurpleLinear,
                            mealType: meals[index].mealType,
                            mealCount: meals[index].foodCount),
                      );
                    }),
                    separatorBuilder: (context, index) => SizedBox(
                          width: 15.w,
                        ),
                    itemCount: meals.length),
              ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
        ));
  }

  List<TodayMealItem> breakfast = [
    TodayMealItem(
        mealIamge: Assets().kNigiri,
        mealName: "Nigiri",
        mealTime: DateTime.now().add(3.hours)),
    TodayMealItem(
        mealIamge: Assets().kGlassOfMilk,
        mealName: 'Low Fat Milk',
        mealTime: DateTime.now().add(5.hours)),
  ];
  List<TodayMealItem> lunch = [
    TodayMealItem(
        mealIamge: Assets().kSalad,
        mealName: "Salad",
        mealTime: DateTime.now().add(4.hours)),
    TodayMealItem(
        mealIamge: Assets().kApplyPie,
        mealName: 'Apple Pie',
        mealTime: DateTime.now().add(8.hours)),
  ];
  List<TodayMealItem> dinner = [
    TodayMealItem(
        mealIamge: Assets().kChickenSteak,
        mealName: "Chicken Steak",
        mealTime: DateTime.now().add(4.hours)),
    TodayMealItem(
        mealIamge: Assets().kCoffee,
        mealName: 'Black Coffee',
        mealTime: DateTime.now().add(4.hours)),
    TodayMealItem(
        mealIamge: Assets().kGlassOfMilk,
        mealName: 'Low Fat Milk',
        mealTime: DateTime.now().add(5.hours)),
  ];
  List<TodayMealItem> snack = [
    TodayMealItem(
        mealIamge: Assets().kSalad,
        mealName: "Salad",
        mealTime: DateTime.now().add(4.hours)),
  ];

  List<MealTypeCardData> meals = [
    MealTypeCardData(
      mealType: 'Breakfast',
      foodCount: 100,
    ),
    MealTypeCardData(
      mealType: 'Lunch',
      foodCount: 150,
    ),
    MealTypeCardData(
      mealType: 'Dinner',
      foodCount: 300,
    ),
    MealTypeCardData(
      mealType: 'Snacks',
      foodCount: 200,
    ),
  ];
  List<TodayMealItem> mealTime({required String mealTime}) {
    if (mealTime == 'Breakfast') {
      return breakfast;
    } else if (mealTime == "Lunch") {
      return lunch;
    } else if (mealTime == 'Dinner') {
      return dinner;
    } else {
      return snack;
    }
  }
}

class MealTypeCardData {
  String mealType;
  int foodCount;

  MealTypeCardData({
    required this.mealType,
    required this.foodCount,
  });
}

class TodayMealItem {
  String mealIamge;
  String mealName;
  DateTime mealTime;
  TodayMealItem({
    required this.mealIamge,
    required this.mealName,
    required this.mealTime,
  });
}
