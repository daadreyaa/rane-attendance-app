import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ShiftChangePage extends StatefulWidget {
  const ShiftChangePage({Key? key}) : super(key: key);
  static const String id = "shift_change_screen";

  @override
  State<ShiftChangePage> createState() => _ShiftChangePageState();
}

class _ShiftChangePageState extends State<ShiftChangePage> {
  DateTime now = DateTime.now();
  late DateTime? startDate = now;
  late DateTime? endDate = now.add(const Duration(days: 7));

  DateFormat formatter = DateFormat('dd-MM-yyyy');

  List<int> shifts = [1, 2, 3];
  late int currentShiftValue = shifts[0];
  late int prefferedShiftValue = shifts[0];

  int indexValue = 0;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shift Change',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffe4e3e9),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffe4e3e9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'Start',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kRoyaleBlue, elevation: 10),
                      child: Text(formatter.format(startDate!)),
                      onPressed: () async {
                        var date = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: startDate,
                          firstDate: DateTime(now.year),
                          lastDate: DateTime(now.year + 1),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          // looping: true,
                        );
                        if (date != null) {
                          setState(() {
                            startDate = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'End',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kRoyaleBlue, elevation: 10),
                      child: Text(formatter.format(endDate!)),
                      onPressed: () async {
                        var date = await DatePicker.showSimpleDatePicker(
                          context,
                          initialDate: startDate,
                          firstDate: DateTime(now.year),
                          lastDate: DateTime(now.year + 1),
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          // looping: true,
                        );
                        if (date != null) {
                          setState(() {
                            endDate = date;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Current Shift',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 75,
                  child: InputDecorator(
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: currentShiftValue,
                        items: shifts.map((int shift) {
                          return DropdownMenuItem(
                            child: Text(
                              shift.toString(),
                              style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.black),
                              ),
                            ),
                            value: shift,
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          setState(() {
                            currentShiftValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Preffered Shift',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 60,
                  width: 75,
                  child: InputDecorator(
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: prefferedShiftValue,
                        items: shifts.map((int shift) {
                          return DropdownMenuItem(
                            child: Text(
                              shift.toString(),
                              style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400, color: Colors.black),
                              ),
                            ),
                            value: shift,
                          );
                        }).toList(),
                        onChanged: (int? value) {
                          setState(() {
                            prefferedShiftValue = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Reliever available',
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ),
                ToggleSwitch(
                  cornerRadius: 20,
                  animate: true,
                  fontSize: 15,
                  inactiveBgColor: Colors.grey.shade500,
                  inactiveFgColor: Colors.white,
                  minWidth: MediaQuery.of(context).size.width * 0.15,
                  initialLabelIndex: indexValue,
                  totalSwitches: 2,
                  labels: const ['NO', 'YES'],
                  customTextStyles: [
                    GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ],
                  onToggle: (index) {
                    // print('switched to: $index');
                    setState(() {
                      indexValue = index!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Visibility(
              visible: indexValue == 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Reliever Name',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: 200,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 1.0),
                        ),
                        border: OutlineInputBorder(),
                      ),
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(fontSize: 16.0),
                      ),
                      onChanged: (newText) {
                        name = newText;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
