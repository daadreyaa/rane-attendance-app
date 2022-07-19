import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/screens/attendance_screen.dart';
import 'package:rane_mobile_app/screens/status_screen.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);
  static const String id = "dashboard_screen";

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAppbarTextColor,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: true,
        title: Text(
          'Hi, User',
          style: kHeadingText,
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 16, 0),
            child: Container(
              width: 50,
              height: 50,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                'https://www.iwmbuzz.com/wp-content/uploads/2021/07/5-times-alexandra-daddario-left-netizens-lovestruck-in-cute-smiles-grey-eyes-3.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'This is your profile summary.',
                style: kHeadingText,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 8),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 0,
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  direction: Axis.horizontal,
                  runAlignment: WrapAlignment.start,
                  verticalDirection: VerticalDirection.down,
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 190,
                            decoration: BoxDecoration(
                              color: const Color(0xffFFFFFF),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x34090F13),
                                  offset: Offset(0, 2),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 8, 12, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                    child: Text(
                                      'Days worked',
                                      style: kPrimaryText,
                                    ),
                                  ),
                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsetsDirectional.fromSTEB(
                                  //           0, 4, 0, 0),
                                  //   child: Text(
                                  //     'June',
                                  //     style: kSecondaryText,
                                  //   ),
                                  // ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 4, 0, 0),
                                          child: Text(
                                            'Count',
                                            style: kSecondaryText,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 4, 0, 0),
                                          child: Text(
                                            '264/400',
                                            style: kSecondaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      child: LinearPercentIndicator(
                                        percent: 264/400,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.37,
                                        lineHeight: 8,
                                        animation: true,
                                        progressColor: const Color(0xff4B39EF),
                                        backgroundColor: kBackgroundColor,
                                        barRadius: const Radius.circular(8),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AttendanceScreen.id);
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                2, 2, 2, 12),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.44,
                              height: 220,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                    color: Color(0x34090F13),
                                    offset: Offset(0, 2),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12, 8, 12, 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 12, 0, 0),
                                      child: Text(
                                        'Attendance',
                                        style: kPrimaryText,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsetsDirectional.fromSTEB(
                                    //           0, 4, 0, 0),
                                    //   child: Text(
                                    //     'April 1-7th',
                                    //     style: kSecondaryText,
                                    //   ),
                                    // ),
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 4, 0),
                                            child: Container(
                                              width: 16,
                                              height: 90,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff39D2C0),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 4, 0),
                                            child: Container(
                                              width: 16,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff39D2C0),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 4, 0),
                                            child: Container(
                                              width: 16,
                                              height: 110,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff39D2C0),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                .fromSTEB(0, 0, 4, 0),
                                            child: Container(
                                              width: 16,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: const Color(0xff39D2C0),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 16,
                                            height: 90,
                                            decoration: BoxDecoration(
                                              color: const Color(0xff39D2C0),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 220,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x34090F13),
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 8, 12, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PL availed',
                                    style: kPrimaryText,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      '34 days',
                                      style:
                                          GoogleFonts.lexendDeca(fontSize: 20),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsetsDirectional.fromSTEB(
                                  //       0, 16, 0, 16),
                                  //   child: Row(
                                  //     mainAxisSize: MainAxisSize.max,
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.center,
                                  //     children: const [
                                  //       Text(
                                  //         '03',
                                  //         // style: TextStyle
                                  //         //     .override(
                                  //         //       fontFamily: 'Poppins',
                                  //         //       fontSize: 82,
                                  //         //       fontWeight: FontWeight.w500,
                                  //         //     ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  Text(
                                    'CL availed',
                                    style: kPrimaryText,
                                  ),
                                  Text(
                                    '23 days',
                                    style: GoogleFonts.lexendDeca(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 12),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.44,
                            height: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                const BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x34090F13),
                                  offset: const Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  12, 8, 12, 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 12, 0, 0),
                                    child: Text(
                                      'Loss of pay',
                                      style: kPrimaryText,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 4, 0, 0),
                                    child: Text(
                                      'Count',
                                      style: kSecondaryText,
                                    ),
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                        //   child: Text(
                                        //     '',
                                        //     style: kPrimaryText,
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 4, 20, 0),
                                          child: Text(
                                            '20 days',
                                            style: kPrimaryText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 8, 0, 0),
                                      child: LinearPercentIndicator(
                                        percent: 0.4,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        lineHeight: 8,
                                        animation: true,
                                        progressColor: const Color(0xff4B39EF),
                                        backgroundColor: kBackgroundColor,
                                        barRadius: const Radius.circular(8),
                                        padding: EdgeInsets.zero,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (() {
                  Navigator.pushNamed(context, StatusScreen.id);
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xff4B39EF),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 12),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                          child: Text(
                            'Status',
                            style: kPrimaryWhiteText,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Text(
                            'Click to see Leave applied / Overtime applied status',
                            style: kSecondaryWhiteText,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Text(
                                  'Check status',
                                  style: kSecondaryWhiteText,
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_right_rounded,
                                color: Colors.white,
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
