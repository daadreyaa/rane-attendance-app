import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/screens/attendance_screen.dart';
import 'package:rane_mobile_app/screens/forgot_punch.dart';
import 'package:rane_mobile_app/screens/leave_screen.dart';

import '../components/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Welcome',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Rajalakshmi_Engineering_College_%28REC%29_Chennai_Logo.jpg/626px-Rajalakshmi_Engineering_College_%28REC%29_Chennai_Logo.jpg',
              ),
              radius: 100,
              backgroundColor: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectOption(
                  option: 'Dashboard',
                  onTap: () {},
                ),
                SelectOption(
                  option: 'Attendance',
                  onTap: () => Navigator.pushNamed(context, AttendanceScreen.id),

                  // onTap: () => print('clicked'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectOption(
                  option: 'Leave/OD',
                  onTap: () => Navigator.pushNamed(context, LeavePage.id),
                ),
                SelectOption(
                  option: 'Shift Change',
                  onTap: () {},
                ),
              ],
            ),
            SelectOption(
              option: 'Forgot Punch',
              onTap: () => Navigator.pushNamed(context, ForgotPunch.id),
              width: 250,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectOption extends StatelessWidget {
  // const SelectOption({
  //   Key? key,
  // }) : super(key: key);

  const SelectOption({required this.option, required this.onTap, this.width = 175});

  final String option;
  final Function()? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            option,
            style: GoogleFonts.lexendDeca(
              textStyle: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.indigo.shade100,
        ),
        height: 60,
        width: width,
      ),
    );
  }
}
