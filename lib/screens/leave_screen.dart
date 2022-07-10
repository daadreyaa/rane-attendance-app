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
      
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: kAppbarTextColor,
        title: Text(
          "Leave/OD",
          style: kHeadingText,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Type of leave: ", style: kPrimaryText),
                  Container(
              color: const Color(0xfff8f8f8),
              alignment: Alignment.center,
              transformAlignment: Alignment.center,
              child: Container(
                color: const Color(0xfff8f8f8),
                child: Container(
                child: ToggleSwitch(
              //  animate: true,
              //  animationDuration: 500,
              //  curve: Curves.decelerate,
                  dividerColor: kRoyaleBlue,
                  activeBorders: [Border.all(color: kRoyaleBlue,width: 2)],
                  borderColor: [kTertiaryColor],
                  borderWidth: 0,
                  activeBgColor: [Colors.white],
                    activeFgColor: Colors.black,
                    inactiveBgColor: kTertiaryColor,
                    inactiveFgColor: Colors.blueGrey,
                    
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    labels: const ['CL', 'PL', 'OD'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfff8f8f8),
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfff8f8f8),
                        Color(0xfff8f8f8),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 154, 154, 154),
                        offset: Offset(10.0, 10.0),
                        blurRadius: 20,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 221, 221, 221),
                        offset: Offset(-10.0, -10.0),
                        blurRadius: 20,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
              ),
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
                    style: ElevatedButton.styleFrom(primary: kRoyaleBlue),
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
                       Container(
              color: const Color(0xfff8f8f8),
              alignment: Alignment.center,
              transformAlignment: Alignment.center,
              child: Container(
                color: const Color(0xfff8f8f8),
                child: Container(
                child: ToggleSwitch(
                    dividerColor: kRoyaleBlue,
                  activeBorders: [Border.all(color: kRoyaleBlue,width: 2)],
                  borderColor: [kTertiaryColor],
                  borderWidth: 0,
                  activeBgColor: [Colors.white],
                    activeFgColor: Colors.black,
                    inactiveBgColor: kTertiaryColor,
                    inactiveFgColor: Colors.blueGrey,
                  
                  
                    minWidth: 90.0,
                    initialLabelIndex: 1,
                    cornerRadius: 10.0,
                   
                    totalSwitches: 2,
                    labels: const ['Half', 'Full'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfff8f8f8),
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfff8f8f8),
                        Color(0xfff8f8f8),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 154, 154, 154),
                        offset: Offset(10.0, 10.0),
                        blurRadius: 20,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 221, 221, 221),
                        offset: Offset(-10.0, -10.0),
                        blurRadius: 20,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
              ),
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
                  Text("End:  ", style: kPrimaryText),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kRoyaleBlue),
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
                      Container(
              color: const Color(0xfff8f8f8),
              alignment: Alignment.center,
              transformAlignment: Alignment.center,
              child: Container(
                color: const Color(0xfff8f8f8),
                child: Container(
                child: ToggleSwitch(
                    dividerColor: kRoyaleBlue,
                  activeBorders: [Border.all(color: kRoyaleBlue,width: 2)],
                  borderColor: [kTertiaryColor],
                  borderWidth: 0,
                  activeBgColor: [Colors.white],
                    activeFgColor: Colors.black,
                    inactiveBgColor: kTertiaryColor,
                    inactiveFgColor: Colors.blueGrey,
                  
                  
                    minWidth: 90.0,
                    initialLabelIndex: 1,
                    cornerRadius: 10.0,
                   
                    totalSwitches: 2,
                    labels: const ['Half', 'Full'],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xfff8f8f8),
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xfff8f8f8),
                        Color(0xfff8f8f8),
                      ],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 154, 154, 154),
                        offset: Offset(10.0, 10.0),
                        blurRadius: 20,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Color.fromARGB(255, 221, 221, 221),
                        offset: Offset(-10.0, -10.0),
                        blurRadius: 20,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
                  
                ],
              ),
            ),
            SizedBox(height: 10,),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Text("Leave Balance", style: kPrimaryText),
            const SizedBox(
              height: 20,
            ),
           
            Padding(
              padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width*0.33,8,8,8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("CL:", style: kPrimaryText),
                      SizedBox(width: 70,),
                      Text("10", style: kPrimaryText),
                    ],
                  ),
                  Row(
                    children: [
                      Text("PL:", style: kPrimaryText),
                      SizedBox(width: 73,),
                      Text("10", style: kPrimaryText),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Total:", style: kPrimaryText),
                      SizedBox(width: 50,),
                      Text("10", style: kPrimaryText),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Availed:", style: kPrimaryText),
                      SizedBox(width: 27,),
                      Text("10", style: kPrimaryText),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Balance:", style: kPrimaryText),
                      SizedBox(width: 20,),
                      Text("10", style: kPrimaryText),
                    ],
                  ),
                  
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RoundedButton(
              title: "Submit",
              color: kRoyaleBlue,
              onPressed: null,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
