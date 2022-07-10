import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/date_time_formatter.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';
import 'package:toggle_switch/toggle_switch.dart';


class OT_Page extends StatefulWidget {
  const OT_Page({ Key? key }) : super(key: key);
static const String id="ot_screen";
  @override
  State<OT_Page> createState() => _OT_PageState();
}

class _OT_PageState extends State<OT_Page> {
    String dropdownvalue = 'Item 1';

  DateTime now = DateTime.now();
  late DateTime? startDate = now;
  late DateTime? endDate = now.add(const Duration(days: 1));

  DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Overtime',
        ),centerTitle: true,
      ),
    
      body: Container(
        child: Column(
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Date:", style: kPrimaryText),
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
                 
                ],
            ),
          ],
        ),
      ),
    );
  }
}

