import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:rane_mobile_app/components/constants.dart';

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
  late DateTime endDate = now;

  bool isPresent = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Attendance', style: kHeadingText),
        centerTitle: true,
        backgroundColor: kAppbarTextColor,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: HorizontalDatePickerWidget(
              locale: 'en_US',
              startDate: startDate,
              endDate: endDate,
              selectedDate: now,
              normalColor: Colors.white,
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
                isPresent ? 'Present' : 'Absent',
                style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(
                    color: kBackgroundColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.6,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: isPresent ? Color(0xFF1CCC5B) : Colors.red,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'In Time'.toString().padRight(17),
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 20.0,
                //   child: Center(
                //     child: Text(':'),
                //   ),
                // ),
                Text(
                  '10:00 AM',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Out Time'.toString().padRight(16),
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 20.0,
                //   child: Center(
                //     child: Text(':'),
                //   ),
                // ),
                Text(
                  '5:00 PM',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Hours'.toString().padRight(15),
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 20.0,
                //   child: Center(
                //     child: Text(':'),
                //   ),
                // ),
                Text(
                  '7 hours',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Shift'.toString().padRight(20),
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                // const SizedBox(
                //   width: 20.0,
                //   child: Center(
                //     child: Text(':'),
                //   ),
                // ),
                Text(
                  '1 (10:00 AM - 5:00PM)',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
