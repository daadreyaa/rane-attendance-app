import 'package:flutter/material.dart';
import 'package:rane_mobile_app/components/constants.dart';

import 'package:rane_mobile_app/components/rounded_button.dart';

class CompPage extends StatefulWidget {
  const CompPage({Key? key}) : super(key: key);
static const String id="comp_page";
  @override
  State<CompPage> createState() => _CompPageState();
}

class _CompPageState extends State<CompPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller1 = TextEditingController();
    TextEditingController _controller2 = TextEditingController();
    TextEditingController _controller3 = TextEditingController();
    TextEditingController _controller4 = TextEditingController();
    return Scaffold(
       backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(
          'C-Off',
          style: kPrimaryText,
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Working days", style: kPrimaryText),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    controller: _controller1,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Eligible Days", style: kPrimaryText),
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    controller: _controller2,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("C-off Days", style: kPrimaryText),
                
                SizedBox(
                  width: 100.0,
                  child: TextField(
                    controller: _controller3,
                    style: const TextStyle(color: Colors.black),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
           const SizedBox(
              height: 50,
            ),
            Text("Reason", style: kPrimaryText),
                
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TextField(
                    controller: _controller4,
                    style: const TextStyle(color: Colors.black),
                    
                  ),
                ),
            
            RoundedButton(
              title: "Apply",
              color: Colors.blue,
              onPressed: null,
              borderRadius: 10,
            )
          ],
        ),
      
      ),
    
    );
  }
}
