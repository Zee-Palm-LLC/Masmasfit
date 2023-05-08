import 'package:camera/camera.dart';
import 'package:masmas_fit/cameras.dart' as cameras;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/onboarding/welcome_screen.dart';

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
            debugShowCheckedModeBanner: false,
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
