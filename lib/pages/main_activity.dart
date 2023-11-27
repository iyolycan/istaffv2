import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istaff/pages/attandance.dart';
import 'package:istaff/pages/counseling.dart';
import 'package:istaff/pages/dashboard.dart';
import 'package:istaff/pages/list_doctor.dart';
import 'package:istaff/pages/management.dart';
import 'package:istaff/utils/helper.dart';
import 'package:istaff/widgets/mybtmnav.dart';

class MainActivity extends StatefulWidget {
  @override
  _MainActivityState createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int activeIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: activeIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          // KeepAlive(
          //   keepAlive: false,
          //   child: Dashboard()
          // ),
          // KeepAlive(
          //   keepAlive: false,
          //   child: AttendanceScreen()
          // ),
          if (activeIndex == 0) Dashboard(),
          if (activeIndex == 1) AttendanceScreen(),
          if (activeIndex == 2) ManagementScreen(),
          if (activeIndex == 3) DoctorListScreen(),
        ],
        onPageChanged: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        activeIndex: activeIndex,
        onTabTapped: (index) {
          setState(() {
            activeIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
