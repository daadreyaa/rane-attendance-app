import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';

class OnDuty extends StatefulWidget {
  const OnDuty({Key? key}) : super(key: key);

  static const String id = 'on_duty_screen';

  @override
  State<OnDuty> createState() => _OnDutyState();
}

class _OnDutyState extends State<OnDuty> {
  DateTime now = DateTime.now();
  late DateTime? date = now;

  DateFormat formatter = DateFormat('dd-MM-yyyy');

  List<String> reasons = ['customer visit', 'supplier visit'];
  String? reasonForOD;

  TimeOfDay? inTime = TimeOfDay.now();
  TimeOfDay? outTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: kAppbarTextColor,
        title: Text(
          "On Duty",
          style: kHeadingText,
        ),
        centerTitle: true,
      ),
      body: Column(
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
                  child: Text(formatter.format(date!)),
                  onPressed: () async {
                    DateTime? selectedDate = await DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime(now.year, now.month, now.day - 14),
                      firstDate: DateTime(now.year - 1),
                      lastDate: DateTime(now.year + 1),
                      dateFormat: "dd-MM-yyyy",
                      locale: DateTimePickerLocale.en_us,
                      // looping: true,
                    );
                    if (selectedDate != null) {
                      setState(() {
                        date = selectedDate;
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
            padding: const EdgeInsets.all(18.0),
            child: Text(
              'Reason',
              textAlign: TextAlign.center,
              style: kPrimaryText,
            ),
          ),
          SizedBox(
            height: 70,
            width: 250,
            child: InputDecorator(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  hint: Text('choose a reason', style: kPrimaryText),
                  value: reasonForOD,
                  items: reasons.map((String reason) {
                    return DropdownMenuItem(
                      child: Text(
                        reason.toString(),
                        style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
                        ),
                      ),
                      value: reason,
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      reasonForOD = value!;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Visibility(
            visible: reasonForOD != null,
            child: RoundedButton(
              title: 'Apply For OD',
              color: kRoyaleBlue,
              onPressed: () {},
              // textColor: Colors.black,
              fontSize: 16.0,
              width: 250,
            ),
          ),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     children: [
      //       const SizedBox(
      //         height: 20.0,
      //       ),
      //       InkWell(
      //         onTap: () async {
      //           DateTime dateTime = DateTime.now();
      //           DateTime? selectedDate = await DatePicker.showSimpleDatePicker(
      //             context,
      //             initialDate: dateTime,
      //             firstDate: DateTime(dateTime.year, dateTime.month - 1, 1),
      //             lastDate: DateTime(dateTime.year, dateTime.month, dateTime.day),
      //             dateFormat: "dd-MMMM-yyyy",
      //             locale: DateTimePickerLocale.en_us,
      //             // looping: true,
      //           );
      //           if (selectedDate != null) {
      //             setState(() {
      //               date = selectedDate;
      //             });
      //           }
      //         },
      //         child: Container(
      //           height: 75,
      //           width: 200,
      //           alignment: Alignment.center,
      //           child: Text(
      //             date == null ? 'Select a date' : formatter.format(date!).toString(),
      //             style: GoogleFonts.lexendDeca(
      //               textStyle: const TextStyle(
      //                 fontSize: 20.0,
      //                 fontWeight: FontWeight.w500,
      //                 color: kRoyaleBlue,
      //               ),
      //             ),
      //           ),
      //           decoration: kBoxDecoration.copyWith(color: Colors.white),
      //         ),
      //       ),
      //       Visibility(
      //         visible: date != null,
      //         child: Column(
      //           children: [
      //             const Divider(
      //               height: 80.0,
      //               thickness: 1.5,
      //               indent: 30.0,
      //               endIndent: 30.0,
      //             ),
      //             Text(
      //               'Select A Reason',
      //               style: kPrimaryText.copyWith(decoration: TextDecoration.underline),
      //             ),
      //             const SizedBox(
      //               height: 30.0,
      //             ),
      //             SizedBox(
      //               height: 70,
      //               width: 250,
      //               child: InputDecorator(
      //                 decoration: const InputDecoration(border: OutlineInputBorder()),
      //                 child: DropdownButtonHideUnderline(
      //                   child: DropdownButton(
      //                     hint: Text('choose a reason', style: kPrimaryText),
      //                     value: reasonForOD,
      //                     items: reasons.map((String reason) {
      //                       return DropdownMenuItem(
      //                         child: Text(
      //                           reason.toString(),
      //                           style: GoogleFonts.lexendDeca(
      //                             textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400, color: Colors.black),
      //                           ),
      //                         ),
      //                         value: reason,
      //                       );
      //                     }).toList(),
      //                     onChanged: (String? value) {
      //                       setState(() {
      //                         reasonForOD = value!;
      //                       });
      //                     },
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             const SizedBox(
      //               height: 30.0,
      //             ),
      //             Visibility(
      //               visible: reasonForOD != null,
      //               child: RoundedButton(
      //                 title: 'Apply For OD',
      //                 color: kRoyaleBlue,
      //                 onPressed: () {},
      //                 // textColor: Colors.black,
      //                 fontSize: 16.0,
      //                 width: 250,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
