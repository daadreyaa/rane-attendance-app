import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/screens/attendance_screen.dart';
import 'package:rane_mobile_app/screens/forgot_punch.dart';
import 'package:rane_mobile_app/screens/leave_screen.dart';
import 'package:rane_mobile_app/screens/overtime_screen.dart';
import 'package:rane_mobile_app/screens/dashboard_screen.dart';

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
          'Welcome, User',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        backgroundColor: kAppbarTextColor,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.center,
              height: 180,
              width: 180,
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://lenstax.com/auth/app-assets/images/profile/user-uploads/user-04.jpg',
                ),
                radius: 80,
              ),
              decoration: const BoxDecoration(
                color: Color(0xffefeeee),
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xffefeeee),
                    Color(0xffefeeee),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xffffffff),
                    offset: Offset(-20.0, -20.0),
                    blurRadius: 30,
                    spreadRadius: 0.0,
                  ),
                  BoxShadow(
                    color: Color(0xffd1d0d0),
                    offset: Offset(20.0, 20.0),
                    blurRadius: 30,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1.5,
              indent: 30,
              endIndent: 30,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectOptionContainer(
                  title: 'Dashboard',
                  imageLocation: 'images/dashboard.png',
                  onTap: ()  => Navigator.pushNamed(context, DashBoardPage.id),
                ),
                SelectOptionContainer(
                  title: 'Attendance',
                  imageLocation: 'images/attendance.png',
                  onTap: () => Navigator.pushNamed(context, AttendanceScreen.id),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectOptionContainer(
                  title: 'Leave/OD',
                  imageLocation: 'images/leave.png',
                  onTap: () => Navigator.pushNamed(context, LeavePage.id),
                ),
                SelectOptionContainer(
                  title: 'Shift Change',
                  imageLocation: 'images/change_shift.png',
                  onTap: (){},
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SelectOptionContainer(
                  title: 'Overtime',
                  imageLocation: 'images/overtime.png',
                  onTap: () => Navigator.pushNamed(context, OvertimeScreen.id),
                ),
                SelectOptionContainer(
                  title: 'Forgot Punch',
                  imageLocation: 'images/forgot_punch.png',
                  onTap: () => Navigator.pushNamed(context, ForgotPunch.id),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SelectOptionContainer extends StatelessWidget {
  // const SelectOptionContainer({
  //   Key? key,
  // }) : super(key: key);

  SelectOptionContainer({required this.title, required this.imageLocation, required this.onTap});

  final String title;
  final String imageLocation;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imageLocation,
              height: 50,
              width: 50,
            ),
            Text(
              title,
              style: kSecondaryText,
            ),
          ],
        ),
        height: 110,
        width: 110,
        alignment: Alignment.center,
        decoration: kBoxDecoration,
      ),
    );
  }
}
