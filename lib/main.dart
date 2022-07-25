import 'package:camera/camera.dart';
import 'dart:async';
import 'package:masmas_fit/cameras.dart' as cameras;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/nav_bar.dart';
import 'package:masmas_fit/meal_planner/meal_planner.dart';
import 'package:masmas_fit/onboarding/welcome_screen.dart';
import 'package:masmas_fit/progress_tracker/comparison_result.dart';
import 'package:masmas_fit/progress_tracker/take_photo.dart';
import 'package:masmas_fit/sleep_tracker/sleep_schedule.dart';
import 'package:masmas_fit/sleep_tracker/sleep_tracker.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras.cameras = await availableCameras();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        
        builder: (context, widget) {
          return GetMaterialApp(
            theme: ThemeData(
                appBarTheme: AppBarTheme(color: kWhite),
                scaffoldBackgroundColor: Colors.white),
            title: 'Masmas Fit',
            builder: (context, widget) {
              final mediaQueryData = MediaQuery.of(context);
              final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.01);
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: scale,
                ),
                child: widget!,
              );
            },
            home: const WelcomeScreen(),
          );
        });
  }
}
