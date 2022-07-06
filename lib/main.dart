import 'package:flutter/material.dart';
import 'package:rane_mobile_app/home_screen.dart';
import 'package:rane_mobile_app/screens/attendance_screen.dart';
import 'package:rane_mobile_app/screens/login_screen.dart';

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
      initialRoute: AttendanceScreen.id,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        HomeScreen.id: (context) => const HomeScreen(),
        AttendanceScreen.id: (context) => const AttendanceScreen(),
      },
    );
  }
}
