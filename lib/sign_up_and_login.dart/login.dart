import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/link_fonts.dart';
import 'package:masmas_fit/sign_up_and_login.dart/complete_profile.dart';
import 'package:masmas_fit/sign_up_and_login.dart/register_page.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/title_fonts.dart';
import 'package:masmas_fit/widgets/custom_text_form_field.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';
import 'package:masmas_fit/widgets/third_party_login_tile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeAreaWrapper(
      backgroundColor: kWhite,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
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
                  'Welcome Back',
                  style: TitleFonts().kBold20.copyWith(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),

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
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot your password?',
                    style: LinkFonts().medium.copyWith(color: kGrey2),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Container(
                  decoration: BoxDecoration(boxShadow: [kBlueShadow]),
                  child: GradientButton(
                      elevation: 1,
                      increaseHeightBy: 18.h,
                      increaseWidthBy: 250.w,
                      gradient: kBlueLinear,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login_rounded,
                            color: kWhite,
                          ),
                          SizedBox(
                            width: 7.5.w,
                          ),
                          Text(
                            'Login',
                            style: TextFonts().kBold16.copyWith(color: kWhite),
                          ),
                        ],
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
                          style: TextFonts().kRegular12.copyWith(color: kBlack),
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
                        Get.off(() => const RegisterPage(),
                            transition: Transition.cupertino);
                      },
                      child: GradientText(
                        'Register',
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
    );
  }
}
