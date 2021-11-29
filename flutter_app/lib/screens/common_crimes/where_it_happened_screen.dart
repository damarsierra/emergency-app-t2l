import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class WhereItHappenedScreen extends StatefulWidget {
  const WhereItHappenedScreen({Key? key}) : super(key: key);

  @override
  State<WhereItHappenedScreen> createState() => _WhereItHappenedScreen();
}

class _WhereItHappenedScreen extends State<WhereItHappenedScreen> {
  @override
  Widget build(BuildContext context) {
      CollectionReference reports = FirebaseFirestore.instance
          .collection('emergency_profile')
          .doc(phoneNum)
          .collection('reports');

      String whereHappened = '';
      Future<void> addToReport(String value) {
        return reports
            .doc('common_crime_report')
            .update({'where_happened': value})
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
                'Where did it happen?',
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: TextFormField(
                textAlign: TextAlign.left,
                style: const TextStyle(fontSize: 20),
                maxLines: 15,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter response here..',
                  alignLabelWithHint: true,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter in value';
                  }
                  whereHappened = value;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    addToReport(whereHappened);
                    Navigator.pushNamed(context, '/SeePerpetrator');
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
      ),
    );
  }
}
