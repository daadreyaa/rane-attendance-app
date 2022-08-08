import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:intl/intl.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({ Key? key }) : super(key: key);
  static String id = "status_screen";

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  DateTime now = DateTime.now();
  late DateTime? cDate = now;
  DateFormat formatter = DateFormat('dd-MM-yyyy');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar:  AppBar(
        title: Text(
          'Status',
          style: GoogleFonts.lexendDeca(
            textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xffe4e3e9),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height:25),
        
        Center(
          child: SizedBox(
            width: 150.0,
            height: 50.0,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: kRoyaleBlue, elevation: 10),
                          
                          child: Text(formatter.format(cDate!)),
                          onPressed: () async {
                            var date = await DatePicker.showSimpleDatePicker(
                              context,
                              initialDate: cDate,
                              firstDate: DateTime(now.year),
                              lastDate: DateTime(now.year + 1),
                              dateFormat: "dd-MMMM-yyyy",
                              locale: DateTimePickerLocale.en_us,
                              // looping: true,
                            );
                            if (date != null) {
                              setState(() {
                                cDate = date;
                              });
                            }
                          },
                        ),
          ),
        ),
        // SizedBox(height:25),
        // Text('WSA- Waiting for Supervisor Approval'),
        // Text('WFHA- Waiting for FH Approval'),

        SizedBox(height:25),
        
        StatusTable(title: 'Leave Status',),
        StatusTable(title: 'On Duty Status',),
        StatusTable(title: 'Shift Change Status',),
        StatusTable(title: 'Overtime Status',),
        StatusTable(title: 'Comp-Off Status',),
        StatusTable(title: 'Forgot Punch Status',),
        
        
      ],
        ),
      ),
    );
  }
}

class StatusTable extends StatelessWidget {
  const StatusTable({
    Key? key,  required this.title,
  }) : super(key: key);
final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$title:",style: kPrimaryText,), 
        
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: 3,
                  columns: [
                    DataColumn(
                      label: Text('Date', style: kTableColumnText),
                    ),
                    DataColumn(
                      label: Text('CL/PL', style: kTableColumnText),
                    ),
                    DataColumn(
                      label: Text('No of days', style: kTableColumnText),
                    ),
                    DataColumn(
                      label: Text('Status', style: kTableColumnText),
                    ),
                  ],
                  rows: [
                    DataRow(selected: true,
                      cells: <DataCell>[
                        DataCell(
                          
                          Text('12/06/2022', style: kTableRowText),
                        ),
                        DataCell(
                          Text('CL', style: kTableRowText),
                        ),
                        DataCell(
                          Text('2', style: kTableRowText),
                        ),
                        DataCell(
                          Text('Approved', style: kTableRowText),
                        ),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                          Text('11/05/2022', style: kTableRowText),
                        ),
                        DataCell(
                          Text('PL', style: kTableRowText),
                        ),
                        DataCell(
                          Text('3', style: kTableRowText),
                        ),
                        DataCell(
                          Text('WFHA', style: kTableRowText),
                        ),
                      ],
                    ),
                    DataRow(selected: true,
                      cells: <DataCell>[
                        DataCell(
                          Text('23/06/2022', style: kTableRowText),
                        ),
                        DataCell(
                          Text('PL', style: kTableRowText),
                        ),
                        DataCell(
                          Text('2', style: kTableRowText),
                        ),
                        DataCell(
                          Text('WSA', style: kTableRowText),
                        ),
                      ],
                    ),
                  ],
                ),
            ),
          ),
        ),
          SizedBox(height: 50,)
      ],
    );
  }
}