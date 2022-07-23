// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_item_card.dart';
import 'package:masmas_fit/meal_planner/meal_schedule_meal.dart';
import 'package:masmas_fit/meal_planner/nutrition_progress_bar.dart';
import 'package:masmas_fit/sleep_tracker/sleep_schedule.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/month_and_year_picker.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class MealSchedule extends StatefulWidget {
  const MealSchedule({Key? key}) : super(key: key);

  @override
  State<MealSchedule> createState() => _MealScheduleState();
}

class _MealScheduleState extends State<MealSchedule> {
  List<DateTime> theWeek = [
    ...List<DateTime>.generate(
        7, (index) => DateTime.now().subtract(Duration(days: index))),
    ...List<DateTime>.generate(
        7,
        (index) => (DateTime.now().add(const Duration(days: 1)))
            .add(Duration(days: index)))
  ];
  final DateFormat dateFormatter = DateFormat('dd-MM-yyyy');
  @override
  void initState() {
    theWeek.sort((a, b) {
      return a.compareTo(b);
    });
    for (int i = 0; i < theWeek.length; i++) {
      theWeek[i] = DateTime(theWeek[i].year, theWeek[i].month, theWeek[i].day);
    }

    super.initState();
  }

  int initialIndex = 7;
  final ScrollController _controller =
      ScrollController(initialScrollOffset: 80.w * 5);
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
          'Meal Schedule',
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
            Align(
                alignment: Alignment.center,
                child: MonthAndYearPicker(monthAndYear: DateTime.now())),
            //date thing
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              height: 100.h,
              child: ListView.separated(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    bool active = index == initialIndex;
                    return Center(
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                initialIndex = index;
                              });
                            },
                            child: dateCard(theWeek[index], active)));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15.w,
                    );
                  },
                  itemCount: theWeek.length),
            ),
            //meals
            ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 30.h),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: schedule.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20.h,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return Center(
                    child: MealScheduleMeal(schedule: schedule[index]));
              },
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Text(
                'Today Meal Nutritions',
                style: TextFonts().kSemiBold16,
              ),
            ),
            ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 30.h),
                physics: const BouncingScrollPhysics(),
                itemBuilder: ((context, index) => Center(
                      child: NutirionProgressBar(
                          nutritiionStat: mealNutiritions[index]),
                    )),
                separatorBuilder: (conntext, index) => SizedBox(
                      height: 15.h,
                    ),
                itemCount: mealNutiritions.length)
          ],
        ),
      ),
      floatingActionButton: CustomFloatingProgressButton(
          value: 0,
          gradient: kPurpleLinear,
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: kWhite,
            size: 12.w,
          )),
    );
  }
}

class NutitionStat {
  String name;
  String nutrientIcon;

  double amountDone;
  double amountRequired;
  String unit;
  NutitionStat({
    this.unit = 'g',
    required this.name,
    required this.nutrientIcon,
    required this.amountDone,
    required this.amountRequired,
  });
}

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

List<MealScheduleItem> schedule = [
  MealScheduleItem(mealTime: 'Breakfast', meals: breakfast, calories: 230),
  MealScheduleItem(mealTime: 'Lunch', meals: lunch, calories: 500),
  MealScheduleItem(mealTime: 'Snacks', meals: snack, calories: 100),
  MealScheduleItem(mealTime: 'Dinner', meals: dinner, calories: 600)
];

class MealScheduleItem {
  String mealTime;
  List<TodayMealItem> meals;
  int calories;
  MealScheduleItem({
    required this.mealTime,
    required this.meals,
    required this.calories,
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
