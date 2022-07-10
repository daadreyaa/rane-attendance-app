import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kTertiaryColor = Color(0xFFF1F4F8);
const Color kSecondaryColor = Color(0xFF6C787F);
const Color kPrimaryColor = Color(0xFF0F1113);
const Color kRoyaleBlue = Color(0xff246EE9);
const Color kBackgroundColor = Color(0xffE4E3E9);

BoxDecoration kBoxDecoration = BoxDecoration(
  color: const Color(0xffefeeee),
  borderRadius: BorderRadius.circular(10),
  gradient: const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffefeeee),
      Color(0xffefeeee),
    ],
  ),
  boxShadow: const [
    BoxShadow(
      color: Color(0xffffffff),
      offset: Offset(-15.0, -15.0),
      blurRadius: 30,
      spreadRadius: 0.0,
    ),
    BoxShadow(
      color: Color(0xffd1d0d0),
      offset: Offset(15.0, 15.0),
      blurRadius: 30,
      spreadRadius: 0.0,
    ),
  ],
);

TextStyle kPrimaryText = GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle kSecondaryText = GoogleFonts.lexendDeca(fontSize: 14, fontWeight: FontWeight.w400);
