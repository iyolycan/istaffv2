import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:istaff/pages/attandance.dart';
import 'package:istaff/pages/counseling.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:istaff/pages/dashboard.dart';
import 'package:istaff/pages/detail_emp_reports.dart';
import 'package:istaff/pages/home.dart';
import 'package:istaff/pages/login.dart';
import 'package:istaff/pages/main_activity.dart';
import 'package:istaff/pages/single_order.dart';
import 'package:istaff/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'iStaff App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Constants.scaffoldBackgroundColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // textTheme: GoogleFonts.poppinsTextTheme(),
          ),
          initialRoute: "/",
          onGenerateRoute: _onGenerateRoute,
        );
      },
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/login":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Login();
      });
    case "/mainactivity":
      return MaterialPageRoute(builder: (BuildContext context) {
        return MainActivity();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    case "/single-order":
      return MaterialPageRoute(builder: (BuildContext context) {
        return SingleOrder();
      });
    case "/chat":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CounselingSession();
      });
    case "/DetailEmpReports":
      return MaterialPageRoute(builder: (BuildContext context) {
        return DetailEmpReports();
      });
    case "/AttendanceScreen":
      return MaterialPageRoute(builder: (BuildContext context) {
        return AttendanceScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}