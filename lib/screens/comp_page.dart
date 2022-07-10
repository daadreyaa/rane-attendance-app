import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import 'package:rane_mobile_app/components/rounded_button.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CompPage extends StatefulWidget {
  const CompPage({Key? key}) : super(key: key);
  static const String id = "comp_page";
  @override
  State<CompPage> createState() => _CompPageState();
}

class _CompPageState extends State<CompPage> {
  String dropdownvalue = 'Item 1';

  DateTime now = DateTime.now();
  late DateTime? startDate = now;
  late DateTime? endDate = now.add(const Duration(days: 1));

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller1 = TextEditingController();

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Comp-Off',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        backgroundColor: kAppbarTextColor,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Work Date:", style: kPrimaryText),
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Comp-off Date:", style: kPrimaryText),
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
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('In Time: ', style: kPrimaryText),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('10:00 AM', style: GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Out Time:', style: kPrimaryText),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('10:10 PM', style: GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total hours:', style: kPrimaryText),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('12 Hrs 10 Mins', style: GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Text("Reason", style: kPrimaryText),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: _controller1,
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              RoundedButton(
                title: "Apply",
                color: kRoyaleBlue,
                onPressed: null,
                borderRadius: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
