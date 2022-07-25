import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/colors.dart';
import 'dart:math' as math;

class AddWorkoutDifficultPicker extends StatefulWidget {
  AddWorkoutDifficultPicker({
    Key? key,
  }) : super(key: key);

  @override
  State<AddWorkoutDifficultPicker> createState() =>
      _AddWorkoutDifficultPickerState();
}

class _AddWorkoutDifficultPickerState extends State<AddWorkoutDifficultPicker> {
  int difficultyIndex = 0;
  List<String> difficulties = ['Easy', "Medium", "Hard", 'Ultra'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 315.w,
      height: 48.h,
      decoration: BoxDecoration(
        color: kBorderColor,
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
                        color: kBorderColor,
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
                        children: List<Widget>.generate(
                          difficulties.length,
                          (index) => Text(
                            difficulties[index],
                            style:
                                TextFonts().kMedium16.copyWith(color: kGrey1),
                          ),
                        )));
              });
        },
        child: Row(
          children: [
            SizedBox(width: 15.w),
            Transform.rotate(
                angle: 90 * math.pi / 180,
                child: LineIcon.alternateExchange(color: kGrey1, size: 20.w)),
            SizedBox(
              width: 10.w,
            ),
            Text('Difficulty',
                style: TextFonts().kRegular12.copyWith(color: kGrey1)),
            const Expanded(child: SizedBox()),
            Text(
              difficulties[difficultyIndex],
              style: TextFonts().kRegular10.copyWith(color: kGrey2),
            ),
            SizedBox(
              width: 5.w,
            ),
            Icon(Icons.navigate_next_rounded, color: kGrey1, size: 20.w),
            SizedBox(width: 15.w),
          ],
        ),
      ),
    );
  }
}
