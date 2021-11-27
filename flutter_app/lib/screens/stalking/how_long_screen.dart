import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class HowLongScreen extends StatefulWidget {
  const HowLongScreen({Key? key}) : super(key: key);

  @override
  State<HowLongScreen> createState() => _HowLongScreen();
}

double _currentSliderValue = 10;
Color gray = const Color.fromRGBO(204, 204, 204, 255);

class _HowLongScreen extends State<HowLongScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    String howLong = "";
    Future<void> addToReport() {
      return reports
          .doc('stalking_report')
          .update({'how_long': howLong})
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
              child: Text(
                'How long have they been doing this?',
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Slider(
                value: _currentSliderValue,
                min: 0,
                max: 20.00,
                divisions: 20,
                activeColor: Colors.grey[600],
                inactiveColor: Colors.grey[600],
                thumbColor: Colors.grey[700],
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                  howLong = value as String;
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    decoration: boxDecoration(),
                    child: OutlinedButton(
                      style: buttonStyle(),
                      onPressed: () {
                        howLong += " Days";
                        addToReport();
                        Navigator.pushNamed(context, '/InPublic');
                      },
                      child: const Text(
                        'Days',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                    decoration: boxDecoration(),
                    child: OutlinedButton(
                      style: buttonStyle(),
                      onPressed: () {
                        howLong += " Weeks";
                        addToReport();
                        Navigator.pushNamed(context, '/InPublic');
                      },
                      child: const Text(
                        'Weeks',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: boxDecoration(),
                      child: OutlinedButton(
                        style: buttonStyle(),
                        onPressed: () {
                          howLong += " Months";
                          addToReport();
                          Navigator.pushNamed(context, '/InPublic');
                        },
                        child: const Text(
                          'Months',
                          textAlign: TextAlign.center,
                        ),
                      ),
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
