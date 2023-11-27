import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:istaff/utils/constants.dart';

class MyBottomNavigationBar extends StatelessWidget {

  final int activeIndex;
  final Function(int) onTabTapped;

  MyBottomNavigationBar({required this.activeIndex, required this.onTabTapped});
  // MyBottomNavigationBar({required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Constants.scaffoldBackgroundColor, // Customize your background color
      buttonBackgroundColor: Constants.primaryColor, // Customize your button background color
      items: [
        Icon(Icons.home, size: 30.0, color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB)),
        Icon(Icons.pin_drop_rounded, size: 30.0, color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB)),
        Icon(Icons.add, size: 30.0, color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB)),
        Icon(Icons.favorite, size: 30.0, color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB)),
        Icon(Icons.settings, size: 30.0, color: activeIndex == 4 ? Colors.white : Color(0xFFC8C9CB)),
      ],
      // onTap: (index) {
      //   // activeIndex = index;
      //   if (index == 1) {
      //     Navigator.pushNamed(context, '/AttendanceScreen');
      //   }
      // },
      onTap: onTabTapped,
    );
  }
}
