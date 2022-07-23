// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class MonthAndYearPicker extends StatefulWidget {
  DateTime monthAndYear;
  MonthAndYearPicker({
    Key? key,
    required this.monthAndYear,
  }) : super(key: key);

  @override
  State<MonthAndYearPicker> createState() => _MonthAndYearPickerState();
}

class _MonthAndYearPickerState extends State<MonthAndYearPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.h,
      width: 167.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                widget.monthAndYear = DateTime(widget.monthAndYear.year,
                    widget.monthAndYear.month - 1, widget.monthAndYear.day);
              });
            },
            child: Icon(
              Icons.navigate_before_rounded,
              color: kGrey2,
              size: 22.w,
            ),
          ),
          InkWell(
            onTap: () async {
              // var temp = await Get.to(() => DatePicker(dob: dob),
              //     transition: Transition.downToUp);

              // setState(() {
              //   dob = temp['dob'];
              // });
              showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 260.h,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(22.r),
                              topRight: Radius.circular(22.r))),
                      child: CupertinoDatePicker(
                        //TODO ADD CIELING
                        //maximumDate: DateTime.now().subtract(Duration(days:3652.5)),
                        dateOrder: DatePickerDateOrder.dmy,
                        mode: CupertinoDatePickerMode.date,
                        initialDateTime: widget.monthAndYear,
                        onDateTimeChanged: (date) {
                          setState(() {
                            widget.monthAndYear = date;
                          });
                        },
                      ),
                    );
                  });
            },
            child: Text(
              "${DateFormat.MMM().format(widget.monthAndYear)} ${widget.monthAndYear.year}",
              style: TextFonts().kRegular14.copyWith(color: kGrey2),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                widget.monthAndYear = DateTime(widget.monthAndYear.year,
                    widget.monthAndYear.month + 1, widget.monthAndYear.day);
              });
            },
            child: Icon(
              Icons.navigate_next_rounded,
              color: kGrey2,
              size: 22.w,
            ),
          )
        ],
      ),
    );
  }
}
