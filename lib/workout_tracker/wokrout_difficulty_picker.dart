// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/assets.dart';
import 'dart:math' as math;
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class WorkoutDifficultPicker extends StatefulWidget {
  WorkoutDifficultPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<WorkoutDifficultPicker> createState() => _WorkoutDifficultPickerState();
}

class _WorkoutDifficultPickerState extends State<WorkoutDifficultPicker> {
  int difficultyIndex = 0;
  List<String> difficulties = ['Easy', "Medium", "Hard", 'Ultra'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: kBorderColor),
        color: kPurple2.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        onTap: () async {
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return Container(
                    height: 130.h,
                    decoration: BoxDecoration(
                        gradient: kPurpleLinear,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22.r),
                            topRight: Radius.circular(22.r))),
                    child: CupertinoPicker(
                      itemExtent: 32.h,
                      onSelectedItemChanged: (int value) {
                        setState(() {
                          difficultyIndex = value;
                        });
                      },
                      children: [
                        Center(
                          child: Text(
                            'Easy',
                            style:
                                TextFonts().kSemiBold16.copyWith(color: kWhite),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Medium',
                            style:
                                TextFonts().kSemiBold16.copyWith(color: kWhite),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Hard',
                            style:
                                TextFonts().kSemiBold16.copyWith(color: kWhite),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Ultra',
                            style:
                                TextFonts().kSemiBold16.copyWith(color: kWhite),
                          ),
                        ),
                      ],
                    ));
              });
        },
        child: Row(
          children: [
            SizedBox(width: 15.w),
            Transform.rotate(
                angle: 90 * math.pi / 180,
                child: LineIcon.alternateExchange(color: kGrey1, size: 22.w)),
            SizedBox(
              width: 10.w,
            ),
            Text('Difficulty',
                style: TextFonts().kRegular12.copyWith(color: kGrey1)),
            const Expanded(child: SizedBox()),
            Text(
              difficulties[difficultyIndex],
              style: TextFonts().kRegular10.copyWith(color: kGrey1),
            ),
            SizedBox(
              width: 10.w,
            ),
            SizedBox(
              width: 10.w,
              height: 10.w,
              child: SvgPicture.asset(
                Assets().kCustomNext,
                color: kGrey1,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }
}
