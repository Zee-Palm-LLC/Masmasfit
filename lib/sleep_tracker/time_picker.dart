import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/widgets/back_button_x.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class TimePicker extends StatefulWidget {
  DateTime now;
  TimePicker({
    Key? key,
    required this.now,
  }) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  @override
  Widget build(BuildContext context) {
    return SafeAreaWrapper(
      backgroundColor: kWhite,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kWhite,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: backButtonX({'dob': widget.now}),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: Get.height / 3,
              width: Get.width,
              child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.time,
                  initialDateTime: widget.now,
                  onDateTimeChanged: (date) {
                    setState(() {
                      widget.now = date;
                    });
                  }),
            ),
            SizedBox(
              height: 25.h,
            ),
            GradientButton(
              increaseHeightBy: 12.h,
              increaseWidthBy: 127.w,
              child: Text('Submit'),
              callback: () {
                Get.back(result: {'bedTime': widget.now});
              },
              gradient: kBlueLinear,
            )
          ],
        ),
      ),
    );
  }
}
