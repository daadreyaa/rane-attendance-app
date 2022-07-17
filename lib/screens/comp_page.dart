import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';

class CompPage extends StatefulWidget {
  const CompPage({Key? key}) : super(key: key);
  static const String id = "comp_page";
  @override
  State<CompPage> createState() => _CompPageState();
}

class _CompPageState extends State<CompPage> {
  DateTime? workedDate;
  DateTime? compDate;
  DateTime now = DateTime.now();

  String reason = '';

  DateFormat formatter = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Work Date:      ", style: kPrimaryText),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: kRoyaleBlue),
                    child: workedDate == null ? const Text('Select Date') : Text(formatter.format(workedDate!)),
                    onPressed: () async {
                      DateTime? date = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime(now.year, now.month, now.day - 1),
                        firstDate: DateTime(now.year, now.month - 1, 1),
                        lastDate: DateTime(now.year, now.month, now.day - 1),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        // looping: true,
                      );
                      if (date != null) {
                        setState(() {
                          workedDate = date;
                        });
                      }
                    },
                  ),
                ],
              ),

              // Column(
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('In Time: ', style: kPrimaryText),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Text('10:00 AM', style: GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w400)),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 20,
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Out Time:', style: kPrimaryText),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Text('10:10 PM', style: GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w400)),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 20,
              //     ),
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         Text('Total hours:', style: kPrimaryText),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //         Text('12:10', style: GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w400)),
              //         const SizedBox(
              //           width: 20,
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
              Visibility(
                visible: workedDate != null,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'In\nTime',
                          style: kTableColumnText.copyWith(fontSize: 18.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Out\nTime',
                          style: kTableColumnText.copyWith(fontSize: 18.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Total\nHours',
                          style: kTableColumnText.copyWith(fontSize: 18.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Text('10:00 AM', style: kTableRowText, textAlign: TextAlign.center),
                          ),
                          DataCell(
                            Text('10:00 PM', style: kTableRowText, textAlign: TextAlign.center),
                          ),
                          DataCell(
                            Text('12:00', style: kTableRowText, textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: workedDate != null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Comp-off Date:", style: kPrimaryText),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kRoyaleBlue),
                      child: compDate == null ? const Text('Select Date') : Text(formatter.format(compDate!)),
                      onPressed: () async {
                        DateTime? date = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(now.year, now.month - 1, 1),
                          lastDate: DateTime(now.year, now.month, now.day),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          // looping: true,
                        );
                        if (date != null) {
                          setState(() {
                            compDate = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Visibility(
                visible: compDate != null,
                child: Column(
                  children: [
                    Text("Reason", style: kPrimaryText),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        onChanged: (String value) => reason = value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                    RoundedButton(
                      title: "Apply",
                      color: kRoyaleBlue,
                      onPressed: null,
                      borderRadius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
