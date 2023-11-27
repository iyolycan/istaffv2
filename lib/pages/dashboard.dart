import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istaff/utils/helper.dart';
import 'package:istaff/widgets/mybtmnav.dart';

import '../utils/constants.dart';
import '../widgets/latest_employee_report.dart';
import '../widgets/latest_att.dart';
import '../widgets/latest_leave.dart';
import '../widgets/latest_task.dart';
import '../widgets/location_slider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

// class _DashboardState extends State<Dashboard> with AutomaticKeepAliveClientMixin{
class _DashboardState extends State<Dashboard> {
  // @override
  // bool get wantKeepAlive => true;
  // Track active index
  int activeIndex = 0;

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // super.build(context);
    return Scaffold(
      // bottomNavigationBar: MyBottomNavigationBar(
      //   activeIndex: 0
      // ),
      backgroundColor: Constants.primaryColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: kToolbarHeight,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Icon(
                        //     Icons.arrow_back_ios,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Welcome Back,\n",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "Cahyo Susilo!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  )
                                ],
                              ),
                            ),
                            Image.asset(
                              "assets/images/user.png",
                              height: 80,
                              width: 80,
                            )
                          ],
                        ),
                        Container(
                          // color: Colors.black,
                          height: 80.0,
                          child:
                          const Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Employee ID",
                                  style: TextStyle(
                                    color: Color.fromARGB(170, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "Division",
                                  style: TextStyle(
                                    color: Color.fromARGB(170, 255, 255, 255),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 0.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "0744390029",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  "System Development",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 200.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: Constants.scaffoldBackgroundColor,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 24.0,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.0,
                          ),
                          child: Text(
                            "Announcement & Events",
                            style: TextStyle(
                              color: Color.fromRGBO(19, 22, 33, 1),
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 7.0),
                        Container(
                          height: ScreenUtil().setHeight(100.0),
                          child: Center(
                            // lets make a widget for the cards
                            child: LocationSlider(),
                          ),
                        ),
                        LatestAtt(),
                        LatestLeave(),
                        Latesttask(),
                        LatestEmployeeReport(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
