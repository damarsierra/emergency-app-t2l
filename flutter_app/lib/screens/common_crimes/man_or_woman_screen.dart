import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class ManOrWomanScreen extends StatefulWidget {
  const ManOrWomanScreen({Key? key}) : super(key: key);

  @override
  State<ManOrWomanScreen> createState() => _ManOrWomanScreen();
}

class _ManOrWomanScreen extends State<ManOrWomanScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile').doc(phoneNum).collection('reports');

    Future<void> addToReport(String personSex) {
      return reports
          .doc('common_crime_report')
          .update({'person_sex': personSex})
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
              padding: EdgeInsets.only(left: 32, right:32, bottom: 16),
              child: Text(
                'Is the perpetrator a man or woman?',
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: boxDecoration(),
                    child: OutlinedButton(
                      style: buttonStyle(),
                      onPressed: () {
                        addToReport("Man");
                        Navigator.pushNamed(context, '/Age');
                      },
                      child: const Text(
                        'Man',
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
                        addToReport("Woman");
                        Navigator.pushNamed(context, '/Age');
                      },
                      child: const Text(
                        'Woman',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    addToReport("Not Sure");
                    Navigator.pushNamed(context, '/ArmedStalking');
                  },
                  child: const Text(
                    "I don't know",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
