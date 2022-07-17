import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  static const String id = 'calendar_screen';

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          'Calendar',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xffe4e3e9),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffe4e3e9),
    );
  }
}
