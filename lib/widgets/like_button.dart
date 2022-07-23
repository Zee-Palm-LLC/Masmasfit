// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masmas_fit/colors.dart';

class LikeButtonn extends StatefulWidget {
  bool liked;
  VoidCallback changeLike;
  LikeButtonn({
    Key? key,
    required this.liked,
    required this.changeLike,
  }) : super(key: key);

  @override
  State<LikeButtonn> createState() => _LikeButtonnState();
}

class _LikeButtonnState extends State<LikeButtonn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32.w,
      height: 32.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: kWhite,
          boxShadow: [kCardShadow],
          borderRadius: BorderRadius.circular(8.r)),
      alignment: Alignment.center,
      child: Center(
        child: InkWell(
          onTap: widget.changeLike,
          child: Icon(
            CupertinoIcons.heart_fill,
            color: widget.liked ? kDanger : kGrey1,
            size: 16.w,
          ),
        ),
      ),
    );
  }
}
