import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({Key? key}) : super(key: key);
  static const String id = "leave_screen";

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  String dropdownvalue = 'Item 1';

  DateTime now = DateTime.now();
  late DateTime? startDate = now;
  late DateTime? endDate = now.add(const Duration(days: 1));

  DateFormat formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leave/OD",
          style: kPrimaryText,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Type of leave: ", style: kPrimaryText),
                  // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor
                  ToggleSwitch(
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    labels: const ['CL', 'PL', 'OD'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Start:", style: kPrimaryText),
                  ElevatedButton(
                      child: Text(formatter.format(startDate!)),
                      onPressed: () async {
                        startDate = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: startDate,
                          firstDate: DateTime(now.year),
                          lastDate: DateTime(now.year + 1),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          // looping: true,
                        );
                        if (startDate != null) setState(() {});
                      }),
                  ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: 1,
                    cornerRadius: 10.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['Half', 'Full'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("End:", style: kPrimaryText),
                  ElevatedButton(
                      child: Text(formatter.format(endDate!)),
                      onPressed: () async {
                        endDate = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: endDate,
                          firstDate: DateTime(now.year),
                          lastDate: DateTime(now.year + 1),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          // looping: true,
                        );
                        if (endDate != null) setState(() {});
                      }),
                  ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: 1,
                    cornerRadius: 10.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: const ['Half', 'Full'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Text("Leave Balance", style: kPrimaryText),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("CL:", style: kPrimaryText),
                  const SizedBox(width: 20),
                  Text("10", style: kPrimaryText),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("PL:", style: kPrimaryText),
                  const SizedBox(width: 20),
                  Text("10", style: kPrimaryText),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              title: "Submit",
              color: Colors.blue,
              onPressed: null,
              borderRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
