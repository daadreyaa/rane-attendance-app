import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class ShiftChangePage extends StatefulWidget {
  const ShiftChangePage({Key? key}) : super(key: key);
  static const String id = "shift_change_screen";

  @override
  State<ShiftChangePage> createState() => _ShiftChangePageState();
}

class _ShiftChangePageState extends State<ShiftChangePage> {
  DateTime now = DateTime.now();
  late DateTime? startDate = now;
  late DateTime? endDate = now.add(const Duration(days: 7));

  DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Overtime',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xffe4e3e9),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffe4e3e9),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Start',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
