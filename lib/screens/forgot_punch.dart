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

  DateFormat formatter = DateFormat('yyyy-MM-dd');

  TimeOfDay? inTime = TimeOfDay.now();
  TimeOfDay? outTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Forgot Punch',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade800,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(38, 20, 38, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date", style: kPrimaryText),
                  ElevatedButton(
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
                    child: Text(inTime!.format(context)),
                    onPressed: () async {
                      inTime = await showTimePicker(
                        context: context,
                        initialTime: inTime!,
                      ) as TimeOfDay;
                      if (inTime != null) setState(() {});
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
                    child: Text(outTime!.format(context)),
                    onPressed: () async {
                      outTime = await showTimePicker(
                        context: context,
                        initialTime: outTime!,
                      ) as TimeOfDay;
                      if (outTime != null) setState(() {});
                    },
                  ),
                ],
              ),
            ),
            RoundedButton(title: 'Apply', color: Colors.lightBlueAccent, onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
