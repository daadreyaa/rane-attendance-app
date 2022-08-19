import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';
import 'package:rane_mobile_app/utils/apiCalls.dart';
import 'package:rane_mobile_app/utils/data.dart';

class OvertimeDetailsScreen extends StatefulWidget {
  const OvertimeDetailsScreen({Key? key}) : super(key: key);

  static const String id = 'overtime_details_screen';

  @override
  State<OvertimeDetailsScreen> createState() => _OvertimeDetailsScreenState();
}

class _OvertimeDetailsScreenState extends State<OvertimeDetailsScreen> {
  String inTime = '';
  String outTime = '';
  String shift = '';
  String otTime = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOTDetails();
  }

  void getOTDetails() async {
    ApiCalls.getOTDetails(Data.getDate(), Data.getEmpId()).then((otDetails) {
      setState(() {
        inTime = otDetails['in_time'];
        outTime = otDetails['out_time'];
        shift = otDetails['Shift'].toString();
        otTime = otDetails['Overtime'];
      });
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
              height: 40.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'In Time:',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Out Time:',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Shift:',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Overtime:',
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      inTime,
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      outTime,
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      shift,
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      otTime,
                      style: GoogleFonts.lexendDeca(
                        textStyle: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            RoundedButton(
              title: 'Apply',
              color: kRoyaleBlue,
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      child: ConfirmationModal(otTime: otTime),
                    );
                  },
                );
              },
              fontSize: 20.0,
            )
          ],
        ),
      ),
    );
  }
}

class ConfirmationModal extends StatelessWidget {
  ConfirmationModal({required this.otTime});

  final String otTime;

  @override
  Widget build(BuildContext context) {
    String machineName = '';
    String description = '';

    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Machine Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kRoyaleBlue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(fontSize: 14.0),
                ),
                onChanged: (newText) {
                  machineName = newText;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'Work Carried Out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kRoyaleBlue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                maxLines: 4,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                style: GoogleFonts.lexendDeca(
                  textStyle: const TextStyle(fontSize: 14.0),
                ),
                onChanged: (newText) {
                  description = newText;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: kRoyaleBlue,
                ),
                onPressed: () {
                  if (machineName != '' && description != '') {
                    ApiCalls.otApply(Data.getEmpId(), machineName, description, Data.getDate(), otTime.split(':')[0]);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Over Time Applied'),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
