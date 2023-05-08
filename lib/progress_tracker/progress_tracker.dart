import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/progress_tracker/compare_my_photo_card.dart';
import 'package:masmas_fit/progress_tracker/learn_more_card.dart';
import 'package:masmas_fit/progress_tracker/reminder_card.dart';
import 'package:masmas_fit/progress_tracker/take_photo.dart';

import 'package:masmas_fit/text_fonts.dart';

import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class ProgressTracker extends StatefulWidget {
  const ProgressTracker({Key? key}) : super(key: key);

  @override
  State<ProgressTracker> createState() => ProgressTrackerState();
}

class ProgressTrackerState extends State<ProgressTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 62.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.0.w),
          child: Center(child: backButtonGrey(null)),
        ),
        title: Text(
          'Progress Photo',
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
        child: Padding(
          padding: EdgeInsets.only(left: 30.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              ReminderCard(),
              SizedBox(
                height: 20.h,
              ),
              LearnMoreCard(),
              SizedBox(
                height: 30.h,
              ),
              CompareMyPhotoCard(),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                width: 315.w,
                height: 25.h,
                child: Row(
                  children: [
                    Text(
                      'Gallery',
                      style: TextFonts().kSemiBold16,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      'See more',
                      style: TextFonts().kMedium12.copyWith(color: kGrey2),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '2 June',
                style: TextFonts().kRegular12.copyWith(color: kGrey1),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                  height: 110.h,
                  width: Get.width,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 100.w,
                          height: 100.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.r),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                      itemCount: images.length)),
              SizedBox(
                height: 15.h,
              ),
              Text(
                '5 May',
                style: TextFonts().kRegular12.copyWith(color: kGrey1),
              ),
              SizedBox(
                height: 5.h,
              ),
              SizedBox(
                  height: 110.h,
                  width: Get.width,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 100.w,
                          height: 100.w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.r),
                            child: Image.network(
                              images[images.length - index - 1],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                      itemCount: images.length)),
            ],
          ),
        ),
      ),
      floatingActionButton: CustomFloatingProgressButton(
          size: 30.w,
          value: 0,
          gradient: kPurpleLinear,
          onPressed: () {
            Get.to(() => const TakePictureScreen(),
                transition: Transition.cupertino);
          },
          child: Icon(
            CupertinoIcons.camera,
            color: kWhite,
            size: 20.w,
          )),
    );
  }
}

List<String> images = [
  'https://ychef.files.bbci.co.uk/1376x774/p07ztf1q.jpg',
  'https://cdn.jefit.com/wp/wp-content/uploads/2017/08/Fitness-Goals.jpg',
  'https://assets.entrepreneur.com/content/3x2/2000/20151012194720-woman-exercising-workout.jpeg',
  'https://montreall.com/wp-content/uploads/2014/02/WomensGyms.jpg',
  'https://www.bodybuilding.com/fun/images/2014/women-and-the-gym-top-10-mistakes_facebook-960x540.jpg',
  'https://image.shutterstock.com/shutterstock/photos/1089543866/display_1500/stock-photo-sexy-athletic-girl-working-out-in-gym-fitness-woman-doing-exercise-1089543866.jpg',
  'https://as1.ftcdn.net/v2/jpg/02/47/03/48/1000_F_247034826_8eP5Wcev5qUJ6L85Cme8gAh9akNWbPOZ.jpg',
  'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/crunches-royalty-free-image-1640004573.jpg',
  'https://thumbs.dreamstime.com/b/fitness-woman-working-out-gym-doing-exercise-back-athletic-girl-rear-view-247002111.jpg',
];
