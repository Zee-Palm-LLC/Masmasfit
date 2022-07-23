import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/profil_menu_entry.dart';

class OtherCard extends StatelessWidget {
  const OtherCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 159.h,
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
              'Other',
              style: TextFonts().kSemiBold16.copyWith(color: kBlack),
            ),
            SizedBox(
              height: 10.h,
            ),
            ProfileMenuItem(
                icon: Icon(
                  Icons.mail_outlined,
                  color: kWhite,
                ),
                entry: 'Contact us'),
            ProfileMenuItem(
                icon: Icon(
                  Icons.verified_user_outlined,
                  color: kWhite,
                ),
                entry: 'Privacy Policy'),
            ProfileMenuItem(
                icon: Icon(
                  CupertinoIcons.settings,
                  color: kWhite,
                ),
                entry: 'Settings'),
          ],
        ),
      ),
    );
  }
}
