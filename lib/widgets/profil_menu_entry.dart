// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/gradient_icon.dart';

class ProfileMenuItem extends StatelessWidget {
  final Widget icon;
  final String entry;
  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.entry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.0.h),
      child: SizedBox(
        height: 25.h,
        width: 280.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            gradientIcon(icon: icon),
            SizedBox(
              width: 10.w,
            ),
            Text(
              entry,
              style: TextFonts().kRegular12.copyWith(color: kGrey1),
            ),
            const Expanded(child: SizedBox()),
            Icon(
              Icons.navigate_next_rounded,
              color: kGrey1,
            )
          ],
        ),
      ),
    );
  }
}
