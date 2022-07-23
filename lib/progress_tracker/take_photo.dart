// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/assets.dart';
import 'package:masmas_fit/cameras.dart' as cameras;

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/text_fonts.dart';
import 'package:masmas_fit/widgets/back_button_grey.dart';
import 'package:masmas_fit/widgets/option_button.dart';
import 'package:masmas_fit/widgets/safe_area_wrapper.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({
    super.key,
  });

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      cameras.cameras.first,
      ResolutionPreset.high,
    );
    _initControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.zero,
      //   child: AppBar(
      //     systemOverlayStyle: const SystemUiOverlayStyle(
      //         statusBarColor: Colors.transparent,
      //         statusBarIconBrightness: Brightness.dark),
      //   ),
      // ),
      body: FutureBuilder<void>(
          future: _initControllerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 375.w,
                    height: 677.h,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: 375.w / 677.h,
                        child: CameraPreview(
                          _controller,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: CameraTab(
                                controller: _controller,
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * 0.9,
                    height: 135.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListView.separated(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Container(
                                  width: 67.5.w,
                                  height: 65.h,
                                  decoration: BoxDecoration(
                                      color: kBorderColor,
                                      borderRadius:
                                          BorderRadius.circular(12.r)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 5.h),
                                    child: SvgPicture.asset(
                                      assets[index],
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 19.5.w,
                                ),
                            itemCount: assets.length)
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  List<String> assets = [
    Assets().kFrontFacing,
    Assets().kLeftFacing,
    Assets().kBackFacing,
    Assets().kRightFacing
  ];
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(imagePath)),
    );
  }
}

class CameraTab extends StatefulWidget {
  final CameraController controller;
  const CameraTab({Key? key, required this.controller}) : super(key: key);

  @override
  State<CameraTab> createState() => _CameraTabState();
}

class _CameraTabState extends State<CameraTab> {
  FlashMode flashMode = FlashMode.off;
  int index = 0;
  List<FlashMode> flashModes = [
    FlashMode.off,
    FlashMode.auto,
    FlashMode.always
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      width: 295.w,
      height: 70.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99.r),
          color: kWhite.withOpacity(0.8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  index += 1;
                  flashMode = flashModes[index % 3];
                  widget.controller.setFlashMode(flashMode);
                });
              },
              icon: Icon(
                flashIcon(flashMode),
                size: 24.w,
                color: kGrey1,
              )),
          SizedBox(
            width: 30.w,
          ),
          GradientButton(
              increaseHeightBy: 20.w,
              gradient: kPurpleLinear,
              shape: const CircleBorder(),
              child: Icon(CupertinoIcons.camera),
              callback: () async {
                await widget.controller.takePicture();
              }),
          SizedBox(
            width: 30.w,
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  index += 1;
                  flashMode = flashModes[index % 3];
                  widget.controller.setFlashMode(flashMode);
                });
              },
              icon: Icon(
                CupertinoIcons.camera_rotate,
                size: 24.w,
                color: kGrey1,
              )),
        ],
      ),
    );
  }
}

IconData flashIcon(FlashMode flashMode) {
  IconData flashIcon = Icons.flash_off_outlined;
  if (flashMode == FlashMode.off) {
    return Icons.flash_off_outlined;
  } else if (flashMode == FlashMode.auto) {
    return Icons.flash_auto_outlined;
  } else if (flashMode == FlashMode.always) {
    return Icons.flash_on_outlined;
  } else {
    return flashIcon;
  }
}
