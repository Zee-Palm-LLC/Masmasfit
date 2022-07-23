import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/onboarding/onboarding_4.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/custom_elevated_button.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';

class OnboardingThree extends StatefulWidget {
  const OnboardingThree({Key? key}) : super(key: key);

  @override
  State<OnboardingThree> createState() => _OnboardingThreeState();
}

class _OnboardingThreeState extends State<OnboardingThree> {
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
                Assets().kOnboarding3,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 64.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                'Eat Well',
                style: TitleFonts().kBold24.copyWith(color: kBlack),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
                style: TextFonts().kRegular14.copyWith(color: kGrey1),
              ),
            )
          ],
        ),
        floatingActionButton: CustomFloatingProgressButton(
            value: 0.75,
            gradient: kBlueLinear,
            onPressed: () {
              Get.to(() => const OnboardingFour(),
                  transition: Transition.rightToLeft);
            },
            child: Icon(
              Icons.navigate_next_sharp,
              size: 30.w,
            )));
  }
}
