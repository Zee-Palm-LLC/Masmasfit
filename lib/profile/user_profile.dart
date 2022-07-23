import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/profile/account_card.dart';
import 'package:masmas_fit/profile/notification_card.dart';
import 'package:masmas_fit/profile/other_card.dart';
import 'package:masmas_fit/text_fonts.dart';

import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWrapper(
      backgroundColor: kWhite,
      child: Scaffold(
          appBar: AppBar(
            leadingWidth: 62.w,
            leading: Padding(
              padding: EdgeInsets.only(left: 30.0.w),
              child: Center(child: backButtonGrey(null)),
            ),
            title: Text(
              'Profile',
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
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: Get.height -
                      MediaQuery.of(context).padding.top -
                      MediaQuery.of(context).padding.bottom,
                  maxWidth: Get.width),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    SizedBox(
                      width: 315.w,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 55.w,
                            height: 55.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: SvgPicture.asset(
                                Assets().kAcitivityDrinkWater,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Masi Ramezanzade',
                                style: TextFonts()
                                    .kMedium14
                                    .copyWith(color: kBlack),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                'Lose a Fat Program',
                                style: TextFonts()
                                    .kRegular12
                                    .copyWith(color: kGrey1),
                              ),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 83.w,
                            child: GradientButton(
                                //shadowColor: Colors.transparent,
                                elevation: 0,
                                gradient: kBlueLinear,
                                child: Text(
                                  'Edit',
                                  style: TextFonts()
                                      .kRegular12
                                      .copyWith(color: kWhite),
                                ),
                                callback: () {}),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        detailCard(field: 'Height', val: 180, unit: 'cm'),
                        detailCard(field: 'Weight', val: 65, unit: 'kg'),
                        detailCard(field: 'Age', val: 22, unit: 'yo')
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    const AccountCard(),
                    SizedBox(
                      height: 15.h,
                    ),
                    const NotificationCard(),
                    SizedBox(
                      height: 15.h,
                    ),
                    const OtherCard(),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

Widget detailCard(
    {required String field, required int val, required String unit}) {
  return Container(
    width: 95.w,
    height: 65.h,
    decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [kCardShadow]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GradientText('$val$unit',
            gradient: kBlueLinear, style: TextFonts().kRegular14),
        Text(
          field,
          style: TextFonts().kRegular12.copyWith(color: kGrey1),
        )
      ],
    ),
  );
}
