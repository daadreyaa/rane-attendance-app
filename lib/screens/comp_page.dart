import 'package:flutter/material.dart';
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

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller1 = TextEditingController();
    TextEditingController _controller2 = TextEditingController();
    TextEditingController _controller3 = TextEditingController();
    TextEditingController _controller4 = TextEditingController();
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'C-Off',
          style: kPrimaryText,
        ),
        centerTitle: true,
      ),
      body: Container(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                  Text('Total In Hours:', style: kPrimaryText),
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
                  Text('Total Out Hours:', style: kPrimaryText),
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
                  controller: _controller4,
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
