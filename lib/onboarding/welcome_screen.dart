import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/onboarding/onboarding_1.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/custom_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(gradient: kBlueLinear),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 2 - 54.h,
            ),
            Column(
              children: [
                RichText(
                    textScaleFactor: tsf,
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'Masmas',
                          style: TitleFonts().kBold36.copyWith(color: kWhite)),
                      TextSpan(
                          text: 'Fit',
                          style: TitleFonts().kBold36.copyWith(color: kBlack)),
                    ])),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Everybody Can Train',
                  style: TextFonts()
                      .kRegular18
                      .copyWith(color: kWhite, fontStyle: FontStyle.normal),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            CustomElevatedButton(
              onPressed: () {
                Get.to(() => const OnboardingOne());
              },
              height: 60.h,
              width: 315.w,
              fillColor: kWhite,
              child: GradientText(
                'Get Started',
                style: TextFonts().kBold16,
                gradient: kBlueLinear,
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }
}
