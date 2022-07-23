// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final String iconPath;
  final Color color;
  const CategoryCard({
    Key? key,
    required this.category,
    required this.iconPath,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.w,
      height: 100.w,
      decoration: BoxDecoration(
        color: color.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 40.w,
            width: 40.w,
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            decoration: BoxDecoration(color: kWhite, shape: BoxShape.circle),
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            category,
            style: TextFonts().kRegular12,
          )
        ],
      ),
    );
  }
}
