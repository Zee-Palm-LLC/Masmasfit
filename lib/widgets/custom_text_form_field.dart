// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icon.dart';
import 'package:masmas_fit/colors.dart';

import 'package:masmas_fit/text_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool isPassword;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hintText;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final Color? fillColor;
  final Function(String)? onSubmitted;
  final Widget? prefixIcon;
  final EdgeInsets? contentPadding;
  CustomTextFormField(
      {Key? key,
      required this.controller,
      required this.isPassword,
      required this.textInputAction,
      required this.keyboardType,
      required this.hintText,
      required this.validator,
      this.onChange,
      this.contentPadding,
      this.onSubmitted,
      this.fillColor,
      this.prefixIcon})
      : super(key: key);
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool show = false;
  @override
  void initState() {
    setState(() {
      show = widget.isPassword;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChange,
      textInputAction: widget.textInputAction,
      obscureText: show,
      keyboardType: widget.keyboardType,
      style: TextFonts().kRegular14,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  icon: show ? LineIcon.eye() : LineIcon.eyeSlash())
              : null,
          prefixIcon: widget.prefixIcon,
          filled: true,
          errorStyle:
              TextFonts().kRegular14.copyWith(color: kWarning, height: 0.5),
          hintText: widget.hintText,
          hintStyle: TextFonts().kRegular14.copyWith(color: kGrey2),
          isDense: true,
          contentPadding: widget.contentPadding ??
              EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusTextFormField),
              borderSide: BorderSide(color: kBorderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusTextFormField),
              borderSide: BorderSide(color: kBlue3, width: 2.w)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusTextFormField),
            borderSide: BorderSide(color: kBorderColor),
          ),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusTextFormField),
              borderSide: BorderSide(color: kWarning)),
          fillColor: widget.fillColor ?? kBorderColor),
    );
  }
}
