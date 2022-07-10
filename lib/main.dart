import 'package:flutter/material.dart';
import 'package:rane_mobile_app/screens/attendance_screen.dart';
import 'package:rane_mobile_app/screens/forgot_punch.dart';
import 'package:rane_mobile_app/screens/home_screen.dart';
import 'package:rane_mobile_app/screens/comp_page.dart';
import 'package:rane_mobile_app/screens/leave_screen.dart';
import 'package:rane_mobile_app/screens/login_screen.dart';
import 'package:rane_mobile_app/screens/overtime_details_screen.dart';
import 'package:rane_mobile_app/screens/overtime_screen.dart';
import 'package:rane_mobile_app/screens/dashboard_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rane_mobile_app/screens/shift_change_screen.dart';

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
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      initialRoute: HomeScreen.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        HomeScreen.id: (context) => const HomeScreen(),
        AttendanceScreen.id: (context) => const AttendanceScreen(),
        LeavePage.id: (context) => const LeavePage(),
        ForgotPunch.id: (context) => const ForgotPunch(),
        CompPage.id: (context) => const CompPage(),
        OvertimeScreen.id: (context) => const OvertimeScreen(),
        OvertimeDetailsScreen.id: (context) => const OvertimeDetailsScreen(),
        ShiftChangePage.id: (context) => const ShiftChangePage(),
        DashBoardPage.id: (context) => const DashBoardPage(),
      },
    );
  }
}
