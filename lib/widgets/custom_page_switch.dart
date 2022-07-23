library custom_page_switch;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';

class CustomPageSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  final LinearGradient gradient;
  final Color? inactiveColor;
  final String title1;
  final String title2;
  final Color activeTextColor;
  final Color inactiveTextColor;
  final double width;
  final double height;
  final double? borderRadius;
  const CustomPageSwitch(
      {Key? key,
      required this.width,
      required this.height,
      required this.value,
      required this.onChanged,
      required this.gradient,
      this.borderRadius,
      this.activeColor,
      this.inactiveColor,
      required this.title1,
      required this.title2,
      this.activeTextColor = Colors.white70,
      this.inactiveTextColor = Colors.white70})
      : super(key: key);

  @override
  _CustomPageSwitchState createState() => _CustomPageSwitchState();
}

class _CustomPageSwitchState extends State<CustomPageSwitch>
    with SingleTickerProviderStateMixin {
  Animation? _circleAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController!, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    return _circleAnimation == null || _animationController == null
        ? Container()
        : AnimatedBuilder(
            animation: _animationController!,
            builder: (context, child) {
              return InkWell(
                onTap: () {
                  if (_animationController!.isCompleted) {
                    _animationController!.reverse();
                  } else {
                    _animationController!.forward();
                  }
                  widget.value == false
                      ? widget.onChanged(true)
                      : widget.onChanged(false);
                },
                child: Container(
                  width: widget.width,
                  height: widget.height,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(widget.borderRadius ?? 99.0.r),
                    color: widget.inactiveColor ?? kBorderColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _circleAnimation!.value == Alignment.centerRight
                            ? SizedBox(
                                width: widget.width / 2,
                                child: Center(
                                  child: Text(
                                    widget.title1,
                                    style: TextFonts()
                                        .kRegular16
                                        .copyWith(color: kGrey2),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 5.h),
                                child: Container(
                                  width: widget.width / 2 - 10.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99.r),
                                      gradient: kBlueLinear),
                                  child: Center(
                                    child: Text(widget.title1,
                                        style: TextFonts()
                                            .kRegular16
                                            .copyWith(color: kWhite)),
                                  ),
                                ),
                              ),
                        _circleAnimation!.value == Alignment.centerLeft
                            ? SizedBox(
                                width: widget.width / 2,
                                child: Center(
                                  child: Text(
                                    widget.title2,
                                    style: TextFonts()
                                        .kRegular16
                                        .copyWith(color: kGrey2),
                                  ),
                                ),
                              )
                            : Padding(
                                padding: EdgeInsets.fromLTRB(0, 5.h, 10.w, 5.h),
                                child: Container(
                                  width: widget.width / 2 - 10.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(99.r),
                                      gradient: kBlueLinear),
                                  child: Center(
                                    child: Text(widget.title2,
                                        style: TextFonts()
                                            .kRegular16
                                            .copyWith(color: kWhite)),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
