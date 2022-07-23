import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/bmi_card.dart';
import 'package:masmas_fit/dashboard/check_today_card.dart';
import 'package:masmas_fit/dashboard/heartbeat_graph.dart';
import 'package:masmas_fit/dashboard/sleep_card.dart';
import 'package:masmas_fit/dashboard/water_card.dart';
import 'package:masmas_fit/sleep_tracker/sleep_tracker.dart';
import 'package:masmas_fit/text_fonts.dart';

import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/notification_button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => MyDashboardState();
}

class MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).padding.top + 15.h,
              horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 315.w,
                height: 55.h,
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Welcome Back,',
                            style:
                                TextFonts().kRegular12.copyWith(color: kGrey2)),
                        Text(
                          'Masi Ramezanzade',
                          style: TitleFonts().kBold20,
                        )
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    NotificationButtonGrey(null)
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              const BMICard(bmi: 20.1),
              SizedBox(
                height: 30.h,
              ),
              const CheckTodayTargetCard(),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Activity Status',
                style: TextFonts().kSemiBold16,
              ),
              SizedBox(
                height: 30.h,
              ),
              HeartBeatGraphBox(),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                width: 315.w,
                height: 315.h,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WaterIntakeCard(),
                    SizedBox(
                      width: 15.w,
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(() => const SleepTracker(),
                              transition: Transition.cupertino);
                        },
                        child: const SleepCard()),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
