import 'dart:developer';

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
import 'package:masmas_fit/sign_up_and_login.dart/register_page.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';

class OnboardingFour extends StatefulWidget {
  const OnboardingFour({Key? key}) : super(key: key);

  @override
  State<OnboardingFour> createState() => _OnboardingFourState();
}

class _OnboardingFourState extends State<OnboardingFour> {
  @override
  Widget build(BuildContext context) {
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
                Assets().kOnboarding4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Improve Sleep  Quality',
                style: TitleFonts().kBold24.copyWith(color: kBlack),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
                style: TextFonts().kRegular14.copyWith(color: kGrey1),
              ),
            )
          ],
        ),
        floatingActionButton: CustomFloatingProgressButton(
            value: 1,
            gradient: kBlueLinear,
            onPressed: () {
              Get.to(() => const RegisterPage(),
                  transition: Transition.rightToLeft);
            },
            child: Icon(
              Icons.navigate_next_sharp,
              size: 30.w,
            )));
  }
}
