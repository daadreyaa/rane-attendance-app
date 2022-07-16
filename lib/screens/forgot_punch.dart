import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';

import '../components/constants.dart';

class ForgotPunch extends StatefulWidget {
  const ForgotPunch({Key? key}) : super(key: key);

  static const String id = 'forgot_punch';

  @override
  State<ForgotPunch> createState() => _ForgotPunchState();
}

class _ForgotPunchState extends State<ForgotPunch> {
  DateTime now = DateTime.now();
  late DateTime? startDate = now;
  late DateTime? endDate = now.add(const Duration(days: 1));

  DateFormat formatter = DateFormat('dd-MM-yyyy');

  TimeOfDay? inTime = TimeOfDay.now();
  TimeOfDay? outTime = TimeOfDay.now();

  String? reason = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Forgot Punch', style: kHeadingText),
        centerTitle: true,
        backgroundColor: kAppbarTextColor,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(38, 20, 38, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date", style: kPrimaryText),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kRoyaleBlue,
                      fixedSize: const Size(120, 30),
                    ),
                    child: Text(formatter.format(startDate!)),
                    onPressed: () async {
                      startDate = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: startDate,
                        firstDate: DateTime(now.year - 1),
                        lastDate: DateTime(now.year + 1),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        // looping: true,
                      );
                      if (startDate != null) setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Actual In-Time", style: kPrimaryText),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kRoyaleBlue,
                      fixedSize: const Size(120, 30),
                    ),
                    child: Text(inTime!.format(context)),
                    onPressed: () async {
                      var time = await showTimePicker(
                        context: context,
                        initialTime: inTime!,
                      );
                      if (time != null) {
                        setState(() {
                          inTime = time;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Actual Out-Time", style: kPrimaryText),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: kRoyaleBlue,
                      fixedSize: const Size(120, 30),
                    ),
                    child: Text(outTime!.format(context)),
                    onPressed: () async {
                      var time = await showTimePicker(
                        context: context,
                        initialTime: outTime!,
                      );
                      if (time != null) {
                        setState(() {
                          outTime = time;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                'Reason',
                textAlign: TextAlign.center,
                style: kPrimaryText,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
              child: TextField(
                textAlign: TextAlign.center,
                maxLines: 3,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                // autofocus: true,
                style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(fontSize: 14.0),
                ),
                onChanged: (newText) {
                  reason = newText;
                },
              ),
            ),
            RoundedButton(title: 'Apply', color: kRoyaleBlue, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
