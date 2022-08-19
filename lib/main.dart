import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rane_mobile_app/providers/user_biometric.dart';
import 'package:rane_mobile_app/screens/attendance_screen.dart';
import 'package:rane_mobile_app/screens/calendar_screen.dart';
import 'package:rane_mobile_app/screens/enter_ngrok.dart';
import 'package:rane_mobile_app/screens/forgot_punch.dart';
import 'package:rane_mobile_app/screens/home_screen.dart';
import 'package:rane_mobile_app/screens/comp_page.dart';
import 'package:rane_mobile_app/screens/leave_screen.dart';
import 'package:rane_mobile_app/screens/login_screen.dart';
import 'package:rane_mobile_app/screens/login_screen_old.dart';
import 'package:rane_mobile_app/screens/on_duty_screen.dart';
import 'package:rane_mobile_app/screens/otp_screen.dart';
import 'package:rane_mobile_app/screens/overtime_details_screen.dart';
import 'package:rane_mobile_app/screens/overtime_screen.dart';
import 'package:rane_mobile_app/screens/dashboard_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rane_mobile_app/screens/profile_screen.dart';
import 'package:rane_mobile_app/screens/shift_change_screen.dart';
import 'package:rane_mobile_app/screens/status_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserBiometric(),
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      initialRoute: EnterNgrok.id,
      routes: {
        LoginScreen.id: (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        AttendanceScreen.id: (context) => const AttendanceScreen(),
        LeavePage.id: (context) => const LeavePage(),
        ForgotPunch.id: (context) => const ForgotPunch(),
        CompPage.id: (context) => const CompPage(),
        OvertimeScreen.id: (context) => const OvertimeScreen(),
        OvertimeDetailsScreen.id: (context) => const OvertimeDetailsScreen(),
        ShiftChangePage.id: (context) => const ShiftChangePage(),
        DashBoardPage.id: (context) => const DashBoardPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        OnDuty.id: (context) => const OnDuty(),
        Calendar.id: (context) => Calendar(),
        LoginPage.id: (context) => const LoginPage(),
        StatusScreen.id: (context) => const StatusScreen(),
        OTPPage.id: (context) => const OTPPage(),
        EnterNgrok.id: (context) => const EnterNgrok(),
      },
    );
  }
}
