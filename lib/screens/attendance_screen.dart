import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horizontal_center_date_picker/datepicker_controller.dart';
import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/providers/user_biometric.dart';
import 'package:rane_mobile_app/utils/apiCalls.dart';
import 'package:rane_mobile_app/utils/data.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({Key? key}) : super(key: key);

  static const String id = 'attendance_screen';

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final DatePickerController _datePickerController = DatePickerController();

  DateTime now = DateTime.now();
  late DateTime startDate = now.subtract(const Duration(days: 90));
  late DateTime endDate = now;

  DateFormat formatter = DateFormat('yyyy-MM-dd');

  bool isPresent = false;
  String inTime = '';
  String outTime = '';
  bool showLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiCalls.getAttendance(formatter.format(DateTime.now()), Data.userBiometric).then((value) {
      print(value.runtimeType);
      print(value.runtimeType == Null);
      if (value.runtimeType != Null) {
        inTime = value['inTime'];
        outTime = value['outTime'];
        isPresent = true;
        print('value $value');
      } else {
        isPresent = false;
        print('value runTimeType is null');
      }
      setState(() {
        showLoading = false;
      });
    });
  }

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
                setState(() {
                  showLoading = true;
                });
                dynamic result = ApiCalls.getAttendance(formatter.format(date), Data.userBiometric).then(
                  (value) {
                    print(value.runtimeType);
                    print(value.runtimeType == Null);
                    if (value.runtimeType != Null) {
                      inTime = value['inTime'];
                      outTime = value['outTime'];
                      isPresent = true;
                      print('value $value');
                    } else {
                      isPresent = false;
                      print('value runTimeType is null');
                    }
                    setState(() {
                      showLoading = false;
                    });
                  },
                );
                // print('result' + result.toString());
                // if (result != Null) {
                //   inTime = result['inTime'];
                //   outTime = result['outTime'];
                //   var dateTime = DateTime.parse(inTime);
                //   print('inTime' + inTime);
                // } else {
                //   isPresent = false;
                // }
                setState(() {});
              },
            ),
          ),
          const SizedBox(height: 20.0),
          Visibility(
            visible: showLoading,
            child: const SizedBox(
              child: Text('Loading ....'),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            child: Center(
              child: Text(
                isPresent ? 'Present' : 'Absent',
                style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(
                    color: Colors.white,
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
          Visibility(
            visible: isPresent,
            child: Column(
              children: [
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
                        inTime,
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
                        outTime,
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
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
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
