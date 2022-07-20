import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rane_mobile_app/providers/user_biometric.dart';
import 'package:rane_mobile_app/screens/home_screen.dart';
import 'package:rane_mobile_app/utils/apiCalls.dart';
import 'package:rane_mobile_app/utils/data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String username = '', password = '';
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('images/Shape1.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 35, top: 8.0),
                      child: Image.asset(
                        "images/rane_bg.png",
                        height: 80.0,
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 0.0),
                      child: Text(
                        'RML- DHRM',
                        style: GoogleFonts.lexendDeca(
                          textStyle: const TextStyle(fontSize: 30.0, color: Color(0xff175EAB), fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "User-id",
                              style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(fontSize: 20.0, color: Color(0xff708090), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                  child: Icon(
                                    Icons.person_outline,
                                    color: Colors.grey,
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextField(
                                    //keyboardType: TextInputType.number,
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.digitsOnly
                                    // ],
                                    // inputFormatters: [
                                    //   FilteringTextInputFormatter.allow(
                                    //       RegExp(r'[0-9]'))
                                    // ],
                                    controller: _username,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your User-id',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    onChanged: (value) {},
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Password",
                              style: GoogleFonts.lexendDeca(
                                textStyle: const TextStyle(fontSize: 20.0, color: Color(0xff708090), fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.withOpacity(0.5),
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isObscure = !isObscure;
                                      });
                                    },
                                    child: Icon(
                                      isObscure ? Icons.lock_open : Icons.lock_outline,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: Colors.grey.withOpacity(0.5),
                                  margin: const EdgeInsets.only(left: 00.0, right: 10.0),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _password,
                                    obscureText: isObscure,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter your password',
                                      hintStyle: TextStyle(color: Colors.grey),
                                    ),
                                    onChanged: (value) {
                                      //set username  text on change
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)],
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: const [0.0, 1.0],
                                colors: [
                                  Colors.deepPurple.shade400,
                                  Colors.blue.shade700,
                                ],
                              ),
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                onPrimary: Colors.white,
                                shadowColor: Colors.black12,
                                elevation: 3,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
                                minimumSize: const Size(180, 50),
                              ),
                              onPressed: () async {
                                var result = await ApiCalls.login(_username.text.trim(), _password.text.trim());
                                print(result);
                                if (result != null) {
                                  String mobileNumber = result['mobile'];
                                  String userBiometric = result['userBiometric'];

                                  context.read<UserBiometric>().updateUserBiometric(userBiometric);
                                  Data.setUserBiometric(userBiometric);
                                  // send otp and verify

                                  Navigator.pushNamed(context, HomeScreen.id);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text('Invalid Credentials'),
                                      action: SnackBarAction(
                                        label: 'Reset',
                                        onPressed: () {
                                          // Some code to undo the change.
                                          _username.text = '';
                                          _password.text = '';
                                        },
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                'Login',
                                style: GoogleFonts.lexendDeca(
                                  textStyle: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
