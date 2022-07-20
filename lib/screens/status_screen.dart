import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/constants.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({ Key? key }) : super(key: key);
  static String id = "status_screen";

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
children: [
  SizedBox(height:50),
  
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Leave Applied:",style: kPrimaryText,),
      Container(
        color:kRoyaleBlue,
        width: 130,
        height:35,
        child: Center(child: Text("Approved",style: kPrimaryWhiteText,)),
      ),
    ],
  ),
  SizedBox(height:50),
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Overtime Applied :",style: kPrimaryText,),
      Container(
        color:kRoyaleBlue,
        width: 130,
        height:35,
        child: Center(child: Text("Approved",style: kPrimaryWhiteText,)),
      ),
    ],
  ),
],
      ),
    );
  }
}