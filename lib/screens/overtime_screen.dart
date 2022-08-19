import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/screens/overtime_details_screen.dart';
import 'package:rane_mobile_app/utils/apiCalls.dart';
import 'package:rane_mobile_app/utils/data.dart';

class OvertimeScreen extends StatefulWidget {
  const OvertimeScreen({Key? key}) : super(key: key);

  static const String id = 'overtime_screen';

  @override
  State<OvertimeScreen> createState() => _OvertimeScreenState();
}

class _OvertimeScreenState extends State<OvertimeScreen> {
  DateTime? selectedDate = DateTime.now();
  DateFormat formatter = DateFormat('MMMM - yyyy');
  DateFormat backendFormat = DateFormat('yyyy/MM');

  List<String> otDatesList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildList(backendFormat.format(selectedDate!));
  }

  void buildList(String month) async {
    print(month);
    ApiCalls.getOTDates(Data.getEmpId(), month).then((dates) => {
          for (dynamic date in dates) {otDatesList.add(date['dates'])},
          setState(() {}),
          print(otDatesList)
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        title: Text(
          'Overtime',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        backgroundColor: const Color(0xffe4e3e9),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffe4e3e9),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () {
                DateTime dateTime = DateTime.now();
                showMonthPicker(
                  context: context,
                  firstDate: DateTime(dateTime.year, dateTime.month - 6),
                  lastDate: DateTime(dateTime.year, dateTime.month),
                  initialDate: dateTime,
                  locale: const Locale("en"),
                ).then((date) {
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                      otDatesList = [];
                    });
                    buildList(backendFormat.format(selectedDate!));
                  }
                });
              },
              child: Container(
                height: 75,
                width: 200,
                alignment: Alignment.center,
                child: Text(
                  selectedDate == null ? 'Select a month' : formatter.format(selectedDate!).toString(),
                  style: GoogleFonts.lexendDeca(
                    textStyle: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                decoration: kBoxDecoration.copyWith(color: Colors.white),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Divider(
                thickness: 1.5,
                indent: 10.0,
                endIndent: 10.0,
              ),
            ),
            Visibility(
              visible: selectedDate != null,
              child: Expanded(
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: otDatesList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Data.setDate(otDatesList[index]);
                          Navigator.pushNamed(context, OvertimeDetailsScreen.id);
                        },
                        child: Card(
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              title: Text(
                                otDatesList[index],
                                style: GoogleFonts.lexendDeca(
                                  textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
