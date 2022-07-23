import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/link_fonts.dart';
import 'package:masmas_fit/onboarding/onboarding_2.dart';

import 'package:masmas_fit/sign_up_and_login.dart/goals.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/custom_drop_down.dart';
import 'package:masmas_fit/widgets/custom_elevated_button.dart';
import 'package:masmas_fit/widgets/custom_text_form_field.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';
import 'package:masmas_fit/widgets/third_party_login_tile.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({Key? key}) : super(key: key);

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  String? gender;
  DateTime? dob;
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isKg = true;
  bool isCm = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title image
              SizedBox(
                height: 377.h,
                width: Get.width,
                child: SvgPicture.asset(
                  Assets().kRegisterPage2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Let’s complete your profile",
                style: TitleFonts().kBold20,
              ),
              Text(
                "It will help us to know more about you!",
                style: TextFonts().kRegular12.copyWith(color: kGrey1),
              ),
              //gender
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 30.h, 50.w, 10.h),
                child: Container(
                  width: 315.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBorderColor),
                    color: kBorderColor,
                    borderRadius: BorderRadius.circular(radiusTextFormField),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 15.w),
                      Icon(
                        Icons.supervisor_account_rounded,
                        color: kGrey1,
                      ),
                      Expanded(
                        child: CustomDropdown(
                            value: gender,
                            itemList: const ['Male', 'Female', 'Non-binary']),
                      ),
                      SizedBox(width: 18.75.w),
                    ],
                  ),
                ),
              ),
              //DOB
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 0, 50.w, 10.h),
                child: Container(
                  width: 315.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: kBorderColor),
                    color: kBorderColor,
                    borderRadius: BorderRadius.circular(radiusTextFormField),
                  ),
                  child: InkWell(
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
                                initialDateTime: dob,
                                onDateTimeChanged: (date) {
                                  setState(() {
                                    dob = date;
                                  });
                                },
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 15.w),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: kGrey1,
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        Text(
                          dob == null
                              ? 'Date of Birth'
                              : formatter.format(dob!),
                          style: TextFonts().kRegular12.copyWith(color: kGrey2),
                        ),
                        SizedBox(width: 18.75.w),
                      ],
                    ),
                  ),
                ),
              ),
              //weight
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 0, 50.w, 10.h),
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 230.w),
                      child: CustomTextFormField(
                          onChange: (value) {
                            formStateCheck();
                          },
                          prefixIcon: LineIcon.weight(
                            color: kGrey1,
                          ),
                          controller: _weightController,
                          isPassword: false,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          hintText: 'Your weight',
                          validator: (value) {
                            if (value == null ||
                                double.tryParse(value) == null) {
                              return 'Enter a valid weight';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      height: 48.w,
                      width: 48.w,
                      child: GradientButton(
                          shapeRadius:
                              BorderRadius.circular(radiusTextFormField),
                          increaseHeightBy: 12.w,
                          elevation: 0,
                          child: Text(isKg ? 'KG' : "lb",
                              style: TextFonts()
                                  .kMedium12
                                  .copyWith(color: kWhite)),
                          gradient: kPurpleLinear,
                          callback: () {
                            setState(() {
                              isKg = !isKg;
                            });
                          }),
                    )
                  ],
                ),
              ),
              //height
              Padding(
                padding: EdgeInsets.fromLTRB(30.w, 0, 50.w, 20.h),
                child: Row(
                  children: [
                    Container(
                      constraints: BoxConstraints(maxWidth: 230.w),
                      child: CustomTextFormField(
                          onChange: (value) {
                            formStateCheck();
                          },
                          prefixIcon: Icon(
                            Icons.swap_vert_rounded,
                            color: kGrey1,
                          ),
                          controller: _heightController,
                          isPassword: false,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          hintText: 'Your height',
                          validator: (value) {
                            if (value == null ||
                                double.tryParse(value) == null) {
                              return 'Enter a valid weight';
                            } else {
                              return null;
                            }
                          }),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    SizedBox(
                      height: 48.w,
                      width: 48.w,
                      child: GradientButton(
                          shapeRadius:
                              BorderRadius.circular(radiusTextFormField),
                          increaseHeightBy: 12.w,
                          elevation: 0,
                          child: Text(isCm ? 'CM' : "In",
                              style: TextFonts()
                                  .kMedium12
                                  .copyWith(color: kWhite)),
                          gradient: kPurpleLinear,
                          callback: () {
                            setState(() {
                              isCm = !isCm;
                            });
                          }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: GradientButton(
                    increaseWidthBy: 354.w,
                    increaseHeightBy: 20.h,
                    gradient: kBlueLinear,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Next',
                            style: TextFonts().kBold16.copyWith(color: kWhite)),
                        Icon(
                          Icons.navigate_next_rounded,
                          color: kWhite,
                        )
                      ],
                    ),
                    callback: () {
                      Get.to(() => const MyGoals(),
                          transition: Transition.rightToLeft);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  void formStateCheck() {
    final formState = _formKey.currentState;
    if (formState!.validate()) {
      setState(() {
        //_isEmailLoginDisabled = false;
      });
    } else {
      setState(() {
        //_isEmailLoginDisabled = true;
      });
    }
  }
}
