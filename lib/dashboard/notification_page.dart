// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          leadingWidth: 62.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 30.0.w),
            child: Center(child: backButtonGrey(null)),
          ),
          title: Text(
            'Notification',
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
        body: Container(
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: notifs.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: Divider(
                            height: 15.h,
                            color: kGrey3,
                            thickness: 1.h,
                          ),
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return NotificationCard(
                            notifImage: notifs[index].notifImage,
                            notif: notifs[index].notif,
                            timeAgo: notifs[index].timeAgo,
                            color: index % 2 == 0 ? kBlue2 : kPurple2);
                      },
                    ),
                  ]),
            ),
          ),
        ));
  }

  List<NotificationModel> notifs = [
    NotificationModel(
        notifImage: Assets().kPie,
        notif: 'Hey, it’s time for lunch',
        timeAgo: 'About 1 minutes ago'),
    NotificationModel(
        notifImage: Assets().kMissedWorkoutCharacter,
        notif: "Don’t miss your lowerbody workout",
        timeAgo: 'About 3 hours ago'),
    NotificationModel(
        notifImage: Assets().kPancake,
        notif: "Hey, let’s add some meals for your b..",
        timeAgo: "About 3 hours ago"),
    NotificationModel(
        notifImage: Assets().kCongratulationsWorkoutCharacter,
        notif: "Congratulations, You have finished A..",
        timeAgo: '29 May')
  ];
}

class NotificationModel {
  final String notifImage;
  final String notif;
  final String timeAgo;
  NotificationModel({
    required this.notifImage,
    required this.notif,
    required this.timeAgo,
  });
}

class NotificationCard extends StatelessWidget {
  final String notifImage;
  final String notif;
  final String timeAgo;
  final Color color;
  const NotificationCard({
    Key? key,
    required this.notifImage,
    required this.notif,
    required this.timeAgo,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w,
      height: 42.h,
      child: Row(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.w),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: color.withOpacity(0.3)),
              width: 40.w,
              height: 40.w,
              child: SvgPicture.asset(
                notifImage,
                fit: BoxFit.contain,
              )),
          SizedBox(
            width: 10.w,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notif,
                style: TextFonts().kMedium12,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(timeAgo,
                  style: TextFonts().kRegular10.copyWith(color: kGrey1))
            ],
          ),
          const Expanded(child: SizedBox()),
          Icon(
            CupertinoIcons.ellipsis_vertical,
            size: 14.w,
            color: kGrey2,
          )
        ],
      ),
    );
  }
}
