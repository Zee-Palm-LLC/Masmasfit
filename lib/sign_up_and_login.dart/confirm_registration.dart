import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/nav_bar.dart';
import 'package:masmas_fit/sleep_tracker/sleep_tracker.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class RegistrationSuccess extends StatelessWidget {
  const RegistrationSuccess({Key? key}) : super(key: key);

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
                height: 100.h,
              ),
              SvgPicture.asset(Assets().kSuccessRegisteration),
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Welcome, Stefani',
                style: TitleFonts().kBold20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 80.w),
                child: Text(
                  'You are all set now, let’s reach your goals together with us',
                  style: TextFonts().kRegular12.copyWith(color: kGrey1),
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(child: SizedBox()),
              Container(
                decoration: BoxDecoration(boxShadow: [kBlueShadow]),
                child: GradientButton(
                    elevation: 1,
                    increaseHeightBy: 18.h,
                    increaseWidthBy: 250.w,
                    gradient: kBlueLinear,
                    child: Text(
                      'Go To Home',
                      style: TextFonts().kBold16.copyWith(color: kWhite),
                    ),
                    callback: () {
                      Get.to(() => const MyNavbar(),
                          transition: Transition.cupertino);
                    }),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
