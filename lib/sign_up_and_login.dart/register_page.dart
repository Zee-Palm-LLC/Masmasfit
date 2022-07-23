import 'dart:developer';

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
import 'package:masmas_fit/sign_up_and_login.dart/complete_profile.dart';
import 'package:masmas_fit/sign_up_and_login.dart/login.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/custom_elevated_button.dart';
import 'package:masmas_fit/widgets/custom_text_form_field.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';
import 'package:masmas_fit/widgets/third_party_login_tile.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool tAndCAccepted = false;
  @override
  Widget build(BuildContext context) {
    final tsf = MediaQuery.of(context).textScaleFactor;
    return SafeAreaWrapper(
      backgroundColor: kWhite,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Container(
              constraints: BoxConstraints(
                  maxHeight: Get.height - MediaQuery.of(context).padding.top),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Hey there,',
                    style: TextFonts().kRegular16.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Create an Account',
                    style: TitleFonts().kBold20.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.h),
                  //name
                  CustomTextFormField(
                      controller: _nameController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: 'Full Name',
                      validator: (value) {},
                      prefixIcon: LineIcon.user()),
                  SizedBox(height: 15.h),
                  //phone number
                  CustomTextFormField(
                      controller: _numberController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: 'Phone Number',
                      validator: (value) {},
                      prefixIcon: LineIcon.phone()),
                  SizedBox(height: 15.h),
                  //email
                  CustomTextFormField(
                      controller: _emailController,
                      isPassword: false,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: 'Email',
                      validator: (value) {},
                      prefixIcon: Icon(Icons.email_outlined)),
                  SizedBox(height: 15.h),
                  //password
                  CustomTextFormField(
                      controller: _passwordController,
                      isPassword: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.name,
                      hintText: 'Password',
                      validator: (value) {},
                      prefixIcon: Icon(Icons.lock_outline_rounded)),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Checkbox(
                          shape: RoundedRectangleBorder(
                              side:
                                  BorderSide(color: kBorderColor, width: 0.5.w),
                              borderRadius: BorderRadius.circular(3.r)),
                          activeColor: kBlue2,
                          value: tAndCAccepted,
                          onChanged: (value) {
                            setState(() {
                              tAndCAccepted = value!;
                            });
                          }),
                      SizedBox(
                        width: 244.w,
                        child: RichText(
                            textScaleFactor: tsf,
                            maxLines: 3,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: 'By continuing you accept our ',
                                  style: TextFonts()
                                      .kRegular10
                                      .copyWith(color: kGrey2)),
                              TextSpan(
                                  text: 'Privacy Policy ',
                                  style: LinkFonts()
                                      .small
                                      .copyWith(color: kGrey2)),
                              TextSpan(
                                  text: 'and ',
                                  style: TextFonts()
                                      .kRegular10
                                      .copyWith(color: kGrey2)),
                              TextSpan(
                                  text: 'Terms of Use',
                                  style: LinkFonts()
                                      .small
                                      .copyWith(color: kGrey2)),
                            ])),
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  Container(
                    decoration: BoxDecoration(boxShadow: [kBlueShadow]),
                    child: GradientButton(
                        elevation: 1,
                        increaseHeightBy: 18.h,
                        increaseWidthBy: 250.w,
                        gradient: kBlueLinear,
                        child: Text(
                          'Register',
                          style: TextFonts().kBold16.copyWith(color: kWhite),
                        ),
                        callback: () {
                          Get.to(() => const CompleteProfile(),
                              transition: Transition.rightToLeft);
                        }),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: Get.width - 60.w,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: kGrey3,
                            height: 1.w,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            'Or',
                            style:
                                TextFonts().kRegular12.copyWith(color: kBlack),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: kGrey3,
                            height: 1.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      thirdPartLoginTile(
                          onTap: () {
                            print('google');
                          },
                          iconPath: Assets().kGoogleLogo),
                      SizedBox(width: 30.w),
                      thirdPartLoginTile(
                          onTap: () {
                            print('facebook');
                          },
                          iconPath: Assets().kFbLogo)
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account? ',
                          style: TextFonts().kRegular14),
                      InkWell(
                        onTap: () {
                          Get.off(() => const LoginPage(),
                              transition: Transition.cupertino);
                        },
                        child: GradientText(
                          'Login',
                          style: TextFonts().kMedium14,
                          gradient: kPurpleLinear,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
