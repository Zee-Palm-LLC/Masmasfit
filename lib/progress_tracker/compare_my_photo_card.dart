import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/progress_tracker/comparison_month_select.dart';
import 'package:masmas_fit/text_fonts.dart';

class CompareMyPhotoCard extends StatelessWidget {
  const CompareMyPhotoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 60.h,
      decoration: BoxDecoration(
        color: kBlue2.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Row(
          children: [
            Text(
              'Compare my Photo',
              style: TextFonts().kMedium14,
            ),
            const Expanded(child: SizedBox()),
            GradientButton(
              elevation: 0,
              callback: () {
                Get.to(() => const ComparisonMonthSelect(),
                    transition: Transition.cupertino);
              },
              gradient: kBlueLinear,
              child: Text('Compare',
                  style: TextFonts().kRegular12.copyWith(color: kWhite)),
            )
          ],
        ),
      ),
    );
  }
}
