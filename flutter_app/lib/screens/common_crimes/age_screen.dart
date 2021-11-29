import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({Key? key}) : super(key: key);

  @override
  State<AgeScreen> createState() => _AgeScreen();
}

double _currentSliderValue = 10;
Color gray = const Color.fromRGBO(204, 204, 204, 255);

class _AgeScreen extends State<AgeScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile').doc(phoneNum).collection('reports');

    Future<void> addToReport(double personAge) {
      return reports
          .doc('common_crime_report')
          .update({'person_age': personAge})
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Row(
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
                    child: Text(
                      'How old are they?',
                      style: TextStyle(
                          color: Color.fromRGBO(226, 226, 226, 30),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Slider(
                    value: _currentSliderValue,
                    min: 18,
                    max: 70,
                    divisions: 52,

                    activeColor: Colors.grey[600],
                    inactiveColor: Colors.grey[600],
                    thumbColor: Colors.grey[700],
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 60),
                        child: Container(
                          decoration: boxDecoration(),
                          child: OutlinedButton(
                            style: buttonStyle(),
                            onPressed: () {
                              addToReport(_currentSliderValue);
                              Navigator.pushNamed(context, '/Height');
                            },
                            child: const Text(
                              'Submit',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
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
