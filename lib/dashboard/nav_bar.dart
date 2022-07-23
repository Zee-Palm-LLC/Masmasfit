// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:masmas_fit/colors.dart';
import 'package:masmas_fit/dashboard/dashboard.dart';
import 'package:masmas_fit/meal_planner/meal_planner.dart';
import 'package:masmas_fit/profile/user_profile.dart';
import 'package:masmas_fit/progress_tracker/progress_tracker.dart';
import 'package:masmas_fit/search/custom_search.dart';
import 'package:masmas_fit/sleep_tracker/sleep_tracker.dart';
import 'package:masmas_fit/widgets/floating_action_progress_button.dart';
import 'package:masmas_fit/workout_tracker/workout_tracker.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomNavbar extends StatefulWidget {
  const CustomNavbar({Key? key}) : super(key: key);

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final List<PersistentBottomNavBarItem> items;
  final ValueChanged<int> onItemSelected;
  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.onItemSelected,
  }) : super(key: key);

  Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
    return Container(
        alignment: Alignment.center,
        height: 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            isSelected
                ? Flexible(
                    child: ShaderMask(
                    shaderCallback: (bounds) {
                      return kPurpleLinear.createShader(bounds);
                    },
                    child: item.icon,
                  ))
                : Flexible(
                    child: IconTheme(
                        data: IconThemeData(size: 24.w, color: kGrey2),
                        child: item.icon)),
            isSelected
                ? Padding(
                    padding: EdgeInsets.all(1.w),
                    child: Container(
                      width: 4.w,
                      height: 4.w,
                      decoration: BoxDecoration(
                          gradient: kPurpleLinear, shape: BoxShape.circle),
                    ),
                  )
                : const SizedBox()
          ],
        ));
  }

  Widget _buildCenterButton() {
    return Transform.translate(
      offset: Offset(0, -10),
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [kBlueShadow],
              shape: BoxShape.circle,
              gradient: kBlueLinear),
          alignment: Alignment.center,
          height: 60.w,
          width: 60.w,
          child: Center(
            child: Icon(
              Icons.search,
              color: kWhite,
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          boxShadow: [kCardShadow],
          border: Border.all(color: Colors.transparent),
          color: Colors.white,
        ),
        width: Get.width,
        height: 100.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items.map((item) {
            int index = items.indexOf(item);
            return Flexible(
                child: InkWell(
                    onTap: () {
                      this.onItemSelected(index);
                    },
                    child: (index == 2)
                        ? _buildCenterButton()
                        : _buildItem(
                            item,
                            selectedIndex == index,
                          )));
          }).toList(),
        ));
  }
}

class MyNavbar extends StatefulWidget {
  const MyNavbar({Key? key}) : super(key: key);

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView.custom(
        context,
        screenTransitionAnimation: ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.easeIn,
            duration: 200.milliseconds),
        controller: _controller,
        itemCount: _pages.length,
        screens: _buildScreens,
        confineInSafeArea: true,
        handleAndroidBackButtonPress: false,
        customWidget: CustomNavBar(
            selectedIndex: _controller.index,
            items: _pages,
            onItemSelected: (index) {
              setState(() {
                _controller.index = index;
              });
            }),
      ),
    );
  }
}

List<PersistentBottomNavBarItem> _pages = [
  PersistentBottomNavBarItem(
    icon: Icon(
      CupertinoIcons.home,
      color: kGrey2,
    ),
  ),
  PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.graph_square, color: kGrey2)),
  PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.home, color: kGrey2)),
  PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.camera, color: kGrey2)),
  PersistentBottomNavBarItem(icon: Icon(CupertinoIcons.person, color: kGrey2)),
];

List<Widget> _buildScreens = const [
  MyDashboard(),
  WorkoutTracker(),
  MealPlanner(),
  ProgressTracker(),
  UserProfile()
];
