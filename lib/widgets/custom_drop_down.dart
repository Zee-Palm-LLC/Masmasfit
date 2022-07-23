// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class CustomDropdown extends StatefulWidget {
  String? value;
  List<String> itemList;
  CustomDropdown({
    Key? key,
    required this.value,
    required this.itemList,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton<String>(
            hint: Text(
              'Choose Gender',
              style: TextFonts().kRegular12.copyWith(color: kGrey2),
            ),
            style: TextFonts().kRegular12.copyWith(color: kGrey2),
            elevation: 0,
            value: widget.value,
            icon: LineIcon.angleDown(color: kGrey2),
            items: widget.itemList.map((e) {
              return DropdownMenuItem(
                child: Text(
                  e,
                  style: TextFonts().kRegular12.copyWith(color: kGrey2),
                ),
                value: e,
              );
            }).toList(),
            underline: const SizedBox(),
            onChanged: (val) {
              setState(() {
                widget.value = val!;
              });
            }),
      ),
    );
  }
}
