import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/progress_tracker/comparison_result.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class ComparisonMonthSelect extends StatefulWidget {
  const ComparisonMonthSelect({Key? key}) : super(key: key);

  @override
  State<ComparisonMonthSelect> createState() => _ComparisonMonthSelectState();
}

class _ComparisonMonthSelectState extends State<ComparisonMonthSelect> {
  DateTime? month1;
  DateTime? month2;
  @override
  Widget build(BuildContext context) {
    return SafeAreaWrapper(
        backgroundColor: kWhite,
        child: Container(
          constraints: BoxConstraints(
              maxHeight: Get.height - MediaQuery.of(context).padding.top,
              maxWidth: Get.width),
          child: Scaffold(
            appBar: AppBar(
              leadingWidth: 62.w,
              leading: Padding(
                padding: EdgeInsets.only(left: 30.0.w),
                child: Center(child: backButtonGrey(null)),
              ),
              title: Text(
                'Comparison',
                style: TextFonts().kBold16,
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: 30.w),
                  child: Center(child: optionButton(null, () {})),
                )
              ],
              backgroundColor: kWhite,
              elevation: 0,
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 315.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: kBorderColor,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: InkWell(
                    onTap: () {
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
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (date) {
                                  month1 = DateTime.now();
                                  setState(() {
                                    month1 = date;
                                  });
                                },
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Icon(
                          CupertinoIcons.calendar,
                          color: kGrey1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Select Month 1',
                          style: TextFonts().kRegular12.copyWith(color: kGrey1),
                        ),
                        const Expanded(child: SizedBox()),
                        month1 == null
                            ? Text(
                                'Select Month',
                                style: TextFonts()
                                    .kRegular10
                                    .copyWith(color: kGrey2),
                              )
                            : Text(
                                '${getMonthName(month1!.month)}, ${month1!.year}',
                                style: TextFonts()
                                    .kRegular10
                                    .copyWith(color: kGrey2),
                              ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: kGrey2,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                Container(
                  width: 315.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                      color: kBorderColor,
                      borderRadius: BorderRadius.circular(16.r)),
                  child: InkWell(
                    onTap: () {
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
                                initialDateTime: DateTime.now(),
                                onDateTimeChanged: (date) {
                                  month2 = DateTime.now();
                                  setState(() {
                                    month2 = date;
                                  });
                                },
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15.w,
                        ),
                        Icon(
                          CupertinoIcons.calendar,
                          color: kGrey1,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          'Select Month 2',
                          style: TextFonts().kRegular12.copyWith(color: kGrey1),
                        ),
                        const Expanded(child: SizedBox()),
                        month1 == null
                            ? Text(
                                'Select Month',
                                style: TextFonts()
                                    .kRegular10
                                    .copyWith(color: kGrey2),
                              )
                            : Text(
                                '${getMonthName(month2!.month)}, ${month2!.year}',
                                style: TextFonts()
                                    .kRegular10
                                    .copyWith(color: kGrey2),
                              ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: kGrey2,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                GradientButton(
                    increaseHeightBy: 30.h,
                    increaseWidthBy: 250.w,
                    gradient: kBlueLinear,
                    child: Text(
                      'Compare',
                      style: TextFonts().kBold16.copyWith(color: kWhite),
                    ),
                    callback: () {
                      Get.to(() => const ComparisonResult(),
                          transition: Transition.cupertino);
                    }),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ));
  }
}
