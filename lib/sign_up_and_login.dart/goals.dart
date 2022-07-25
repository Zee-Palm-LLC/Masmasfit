import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/sign_up_and_login.dart/confirm_registration.dart';
import 'package:masmas_fit/sign_up_and_login.dart/goal_card.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class MyGoals extends StatefulWidget {
  const MyGoals({Key? key}) : super(key: key);

  @override
  State<MyGoals> createState() => MyGoalsState();
}

class MyGoalsState extends State<MyGoals> {
  final PageController _pc =
      PageController(viewportFraction: 0.8, initialPage: 1);
  int activePage = 1;
  @override
  Widget build(BuildContext context) {
    return SafeAreaWrapper(
        backgroundColor: kWhite,
        child: Scaffold(
          body: Container(
            constraints: BoxConstraints(
                maxWidth: Get.width,
                maxHeight: Get.height - MediaQuery.of(context).padding.top),
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text('What is your goal ?', style: TitleFonts().kBold20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 95.w),
                  child: Text(
                      'It will help us to choose a best program for you',
                      style: TextFonts().kRegular12.copyWith(color: kGrey1),
                      textAlign: TextAlign.center),
                ),
                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  width: Get.width,
                  height: 500.h,
                  child: PageView.builder(
                      controller: _pc,
                      onPageChanged: (page) {
                        setState(() {
                          activePage = page;
                        });
                      },
                      itemCount: goals.length,
                      pageSnapping: true,
                      itemBuilder: (context, pagePosition) {
                        bool active = activePage == pagePosition;
                        double margin = active ? 10.w : 50.w;
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: margin),
                          child: GoalCard(
                              active: active,
                              title: goals[pagePosition]['title']!,
                              imagePath: goals[pagePosition]['imagePath']!,
                              description: goals[pagePosition]['description']!),
                        );
                      }),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: GradientButton(
                      elevation: 1,
                      shadowColor: kPurpleShadowColor,
                      increaseWidthBy: Get.width,
                      increaseHeightBy: 18.h,
                      gradient: kBlueLinear,
                      child: Text(
                        'Confirm',
                        style: TextFonts().kBold16.copyWith(color: kWhite),
                      ),
                      callback: () {
                        Get.to(() => const RegistrationSuccess(),
                            transition: Transition.cupertino);
                      }),
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ),
        ));
  }
}

final goals = [
  {
    'title': 'Improve shape',
    'imagePath': Assets().kRegisterImproveShape,
    'description':
        "I have a low amount of body fat and need / want to build more muscle"
  },
  {
    'title': 'Lean & Tone',
    'imagePath': Assets().kRegisterLeanTone,
    'description':
        'I’m “skinny fat”. look thin but have no shape. I want to add learn muscle in the right way'
  },
  {
    'title': 'Lose a Fat',
    'imagePath': Assets().kRegisterLoseFat,
    'description':
        'I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass'
  }
];
