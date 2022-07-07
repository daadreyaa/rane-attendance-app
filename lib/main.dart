import 'package:flutter/material.dart';
import 'package:rane_mobile_app/screens/forgot_punch.dart';
import 'package:rane_mobile_app/screens/home_screen.dart';
import 'package:rane_mobile_app/screens/comp_page.dart';
import 'package:rane_mobile_app/screens/leave_screen.dart';
import 'package:rane_mobile_app/screens/login_screen.dart';

import 'screens/attendance_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendence App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        HomeScreen.id: (context) => const HomeScreen(),
        AttendanceScreen.id: (context) => const AttendanceScreen(),
        LeavePage.id: (context) => const LeavePage(),
        ForgotPunch.id: (context) => const ForgotPunch(),
        CompPage.id: (context) => const CompPage(),
      },
    );
  }
}
