import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/custom_switch.dart';
import 'package:masmas_fit/widgets/gradient_icon.dart';
import 'package:masmas_fit/widgets/profil_menu_entry.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  bool notifications = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 99.h,
      decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 15.w, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Notification',
              style: TextFonts().kSemiBold16.copyWith(color: kBlack),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                gradientIcon(
                    icon: Icon(
                  CupertinoIcons.bell,
                  color: kWhite,
                )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Pop-up Notification',
                  style: TextFonts().kRegular12.copyWith(color: kGrey1),
                ),
                const Expanded(child: SizedBox()),
                CustomSwitch(
                    width: 36.w,
                    height: 22.h,
                    value: notifications,
                    onChanged: (value) {
                      setState(() {
                        notifications = value;
                      });
                    },
                    gradient: kPurpleLinear)
              ],
            )
          ],
        ),
      ),
    );
  }
}
