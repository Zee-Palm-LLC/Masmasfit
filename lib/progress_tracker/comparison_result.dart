import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/progress_tracker/view_stats.dart';

import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/custom_page_switch.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';
import 'package:masmas_fit/widgets/share_button.dart';

class ComparisonResult extends StatefulWidget {
  const ComparisonResult({Key? key}) : super(key: key);

  @override
  State<ComparisonResult> createState() => _ComparisonResultState();
}

class _ComparisonResultState extends State<ComparisonResult> {
  String month1 = 'May';
  String month2 = 'June';
  bool photo = false;
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
            'Result',
            style: TextFonts().kBold16,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 15.0.w),
              child: Center(
                child: shareButton(onTap: () {
                  log('share');
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.w),
              child: Center(child: optionButton(null, () {})),
            )
          ],
          backgroundColor: kWhite,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            CustomPageSwitch(
                width: 315.w,
                height: 60.h,
                value: photo,
                onChanged: (newBool) {
                  setState(() {
                    photo = newBool;
                  });
                },
                gradient: kBlueLinear,
                title1: 'Photo',
                title2: 'Statistic'),
            photo
                ? ViewStatistics()
                : Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                          width: 315.w,
                          height: 25.h,
                          child: Row(
                            children: [
                              Text(
                                'Average Progress',
                                style: TextFonts().kSemiBold16,
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                'Good',
                                style: TextFonts()
                                    .kRegular12
                                    .copyWith(color: kSuccess),
                              )
                            ],
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 315.w,
                        height: 20.h,
                        child: Row(
                          children: [
                            Container(
                              width: 0.62 * 315.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(99.r),
                                      bottomLeft: Radius.circular(99.r)),
                                  gradient: kPogressBarLinear),
                              child: Center(
                                child: Text(
                                  '62%',
                                  style: TextFonts()
                                      .kRegular12
                                      .copyWith(color: kWhite),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(99.r),
                                    bottomRight: Radius.circular(99.r)),
                                color: kBorderColor,
                              ),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      SizedBox(
                          width: 315.w,
                          height: 25.h,
                          child: Row(
                            children: [
                              Text(
                                month1,
                                style: TextFonts()
                                    .kSemiBold16
                                    .copyWith(color: kGrey1),
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                month2,
                                style: TextFonts()
                                    .kSemiBold16
                                    .copyWith(color: kGrey1),
                              )
                            ],
                          )),
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        }),
                        child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(bottom: 20.h),
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return SizedBox(
                                height: 210.h,
                                child: Column(
                                  children: [
                                    Text(categories[index],
                                        style: TextFonts().kRegular14.copyWith(
                                              color: kGrey1,
                                            )),
                                    SizedBox(
                                      height: 15.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w),
                                      child: Row(children: [
                                        SizedBox(
                                          width: 150.w,
                                          height: 150.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            child: Image.network(
                                              imagesMont1[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        SizedBox(
                                          width: 150.w,
                                          height: 150.w,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.r),
                                            child: Image.network(
                                              imagesMonth2[index],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    )
                                  ],
                                ),
                              );
                            }),
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 15.h);
                            },
                            itemCount: categories.length),
                      ),
                      SizedBox(
                        width: 315.w,
                        child: GradientButton(
                            gradient: kBlueLinear,
                            increaseHeightBy: 30.h,
                            increaseWidthBy: 300.w,
                            child: Text(
                              'Back to Home',
                              style:
                                  TextFonts().kBold16.copyWith(color: kWhite),
                            ),
                            callback: () {}),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
          ]),
        ),
      ),
    );
  }

  List<String> categories = [
    'Front Facing',
    'Back Facing',
    'Left Facing',
    'Right Facing'
  ];
  List<String> imagesMont1 = [
    'https://ychef.files.bbci.co.uk/1376x774/p07ztf1q.jpg',
    'https://cairowestmag.com/wp-content/uploads/2018/12/5b43ccf31335b831008b4c1c-750-563.jpg',
    'https://cdn.jefit.com/wp/wp-content/uploads/2017/08/Fitness-Goals.jpg',
    'https://assets.entrepreneur.com/content/3x2/2000/20151012194720-woman-exercising-workout.jpeg',
  ];
  List<String> imagesMonth2 = [
    'https://www.bodybuilding.com/fun/images/2014/women-and-the-gym-top-10-mistakes_facebook-960x540.jpg',
    'https://image.shutterstock.com/shutterstock/photos/1089543866/display_1500/stock-photo-sexy-athletic-girl-working-out-in-gym-fitness-woman-doing-exercise-1089543866.jpg',
    'https://as1.ftcdn.net/v2/jpg/02/47/03/48/1000_F_247034826_8eP5Wcev5qUJ6L85Cme8gAh9akNWbPOZ.jpg',
    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crunches-royalty-free-image-1640004573.jpg',
  ];
}
