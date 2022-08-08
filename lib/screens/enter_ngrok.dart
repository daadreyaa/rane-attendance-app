import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rane_mobile_app/components/constants.dart';
import 'package:rane_mobile_app/components/rounded_button.dart';
import 'package:rane_mobile_app/screens/login_screen.dart';
import 'package:rane_mobile_app/utils/apiCalls.dart';

class EnterNgrok extends StatefulWidget {
  const EnterNgrok({Key? key}) : super(key: key);

  static const String id = 'enter_ngrok';

  @override
  State<EnterNgrok> createState() => _EnterNgrokState();
}

class _EnterNgrokState extends State<EnterNgrok> {
  String link = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
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
                link = newText;
              },
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          RoundedButton(
            title: 'GO',
            color: Colors.lightBlueAccent,
            onPressed: () {
              // ApiCalls.setApiUrl(link);
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
