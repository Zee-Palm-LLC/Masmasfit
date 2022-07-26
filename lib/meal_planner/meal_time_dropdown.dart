// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masmas_fit/assets.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class MealTimeDropdown extends StatefulWidget {
  String dropdownValue;
  Function(String?) stateFunction;
  MealTimeDropdown({
    Key? key,
    required this.dropdownValue,
    required this.stateFunction,
  }) : super(key: key);

  @override
  State<MealTimeDropdown> createState() => _MealTimeDropdownState();
}

class _MealTimeDropdownState extends State<MealTimeDropdown> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: kBlueLinear, borderRadius: BorderRadius.circular(50.r)),
      child: SizedBox(
        width: 90.w,
        height: 30.h,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            style: TextFonts().kRegular10.copyWith(color: kWhite),
            isExpanded: true,
            value: widget.dropdownValue,
            items: [
              'Breakfast',
              'Lunch',
              'Dinner',
              'Snack',
            ].map((item) {
              return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextFonts().kRegular10.copyWith(color: kWhite),
                  ));
            }).toList(),
            onChanged: (newValue) {
              widget.stateFunction(newValue);
            },
            underline: Container(),
            dropdownColor: kBlue2,
            icon: Padding(
              padding: EdgeInsets.only(right: 5.w),
              child: SizedBox(
                  width: 15.w,
                  height: 15.w,
                  child: SvgPicture.asset(
                    Assets().kCustomPointDown,
                    fit: BoxFit.contain,
                    color: kWhite,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
