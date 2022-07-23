import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/onboarding/onboarding_2.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/custom_elevated_button.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';

class OnboardingOne extends StatefulWidget {
  const OnboardingOne({Key? key}) : super(key: key);

  @override
  State<OnboardingOne> createState() => _OnboardingOneState();
}

class _OnboardingOneState extends State<OnboardingOne> {
  @override
  Widget build(BuildContext context) {
    final fsp = MediaQuery.of(context).textScaleFactor;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: 460.h,
              child: SvgPicture.asset(
                Assets().kOnboarding1,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Track your goal',
                textScaleFactor: fsp,
                style: TitleFonts().kBold24.copyWith(color: kBlack),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Dont' worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
                textScaleFactor: fsp,
                style: TextFonts().kRegular14.copyWith(color: kGrey1),
              ),
            )
          ],
        ),
        floatingActionButton: CustomFloatingProgressButton(
            value: 0.25,
            gradient: kBlueLinear,
            onPressed: () {
              Get.to(() => const OnboardingTwo(),
                  transition: Transition.rightToLeft);
            },
            child: Icon(
              Icons.navigate_next_sharp,
              size: 30.w,
            )));
  }
}
