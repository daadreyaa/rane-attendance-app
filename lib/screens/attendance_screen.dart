import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  static const String id = 'attendance_screen';

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final DatePickerController _datePickerController = DatePickerController();

  DateTime now = DateTime.now();
  late DateTime startDate = now.subtract(const Duration(days: 14));
  late DateTime endDate = now.add(const Duration(days: 7));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Attendance',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              color: Colors.grey,
              alignment: Alignment.center,
              child: HorizontalDatePickerWidget(
                locale: 'en_US',
                startDate: startDate,
                endDate: endDate,
                selectedDate: now,
                normalColor: Colors.yellow,
                widgetWidth: MediaQuery.of(context).size.width,
                datePickerController: _datePickerController,
                onValueSelected: (date) {
                  print('selected = ${date.toIso8601String()}');
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Container(
              child: Center(
                child: Text(
                  'Present',
                  style: GoogleFonts.lexendDeca(
                      textStyle: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.7,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.blue.shade300,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
