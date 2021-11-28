import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class RaceScreen extends StatefulWidget {
  const RaceScreen({Key? key}) : super(key: key);

  @override
  State<RaceScreen> createState() => _RaceScreen();
}

class _RaceScreen extends State<RaceScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    Future<void> addToReport(String personRace) {
      return reports
          .doc('common_crime_report')
          .update({'person_race': personRace})
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          //this can be changed
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //place any widgets here in this array
            const Padding(
              padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
              child: Text(
                "What race was the perpetrator?",
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: boxDecoration(),
                        child: OutlinedButton(
                          style: buttonStyle(),
                          onPressed: () {
                            addToReport('White');
                            Navigator.pushNamed(context, '/OtherDetails');
                          },
                          child: const Text(
                            'White',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: boxDecoration(),
                        child: OutlinedButton(
                          style: buttonStyle(),
                          onPressed: () {
                            addToReport('Black');
                            Navigator.pushNamed(context, '/OtherDetails');
                          },
                          child: const Text(
                            'Black',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: boxDecoration(),
                        child: OutlinedButton(
                          style: buttonStyle(),
                          onPressed: () {
                            addToReport('Hispanic');
                            Navigator.pushNamed(context, '/OtherDetails');
                          },
                          child: const Text(
                            'Hispanic',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        decoration: boxDecoration(),
                        child: OutlinedButton(
                          style: buttonStyle(),
                          onPressed: () {
                            addToReport('Asian');
                            Navigator.pushNamed(context, '/OtherDetails');
                          },
                          child: const Text(
                            'Asian',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: boxDecoration(),
                      child: OutlinedButton(
                        style: buttonStyle(),
                        onPressed: () {
                          addToReport('Other');
                          Navigator.pushNamed(context, '/OtherDetails');
                        },
                        child: const Text(
                          'Other',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      decoration: boxDecoration(),
                      child: OutlinedButton(
                        style: buttonStyle(),
                        onPressed: () {
                          addToReport('Unknown');
                          Navigator.pushNamed(context, '/OtherDetails');
                        },
                        child: const Text(
                          'Unknown',
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
