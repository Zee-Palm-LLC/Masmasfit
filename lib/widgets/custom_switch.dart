library custom_switch;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  final LinearGradient gradient;
  final Color inactiveColor;

  final double width;
  final double height;
  final double? borderRadius;
  const CustomSwitch({
    Key? key,
    required this.width,
    required this.height,
    required this.value,
    required this.onChanged,
    required this.gradient,
    this.borderRadius,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
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
              return GestureDetector(
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
                        BorderRadius.circular(widget.borderRadius ?? 20.0.r),
                    color: _circleAnimation!.value == Alignment.centerLeft
                        ? widget.inactiveColor
                        : null,
                    gradient: _circleAnimation!.value == Alignment.centerLeft
                        ? null
                        : widget.gradient,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _circleAnimation!.value == Alignment.centerRight
                            ? const Expanded(child: SizedBox())
                            : Container(),
                        Align(
                          alignment: _circleAnimation!.value,
                          child: Container(
                            width: widget.height,
                            height: widget.height,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.white),
                          ),
                        ),
                        _circleAnimation!.value == Alignment.centerLeft
                            ? const Expanded(child: SizedBox())
                            : Container(),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
