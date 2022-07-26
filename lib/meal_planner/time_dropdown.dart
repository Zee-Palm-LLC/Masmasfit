// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masmas_fit/assets.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class TimeDropdown extends StatefulWidget {
  String dropdownValue;
  Function(String?) stateFunction;
  TimeDropdown({
    Key? key,
    required this.dropdownValue,
    required this.stateFunction,
  }) : super(key: key);

  @override
  State<TimeDropdown> createState() => _TimeDropdownState();
}

class _TimeDropdownState extends State<TimeDropdown> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          gradient: kBlueLinear, borderRadius: BorderRadius.circular(50.r)),
      child: SizedBox(
        width: 80.w,
        height: 30.h,
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<String>(
            isExpanded: true,
            value: widget.dropdownValue,
            items: ['Weekly', 'Monthly'].map((item) {
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
