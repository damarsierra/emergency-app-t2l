import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class WearingScreen extends StatefulWidget {
  const WearingScreen({Key? key}) : super(key: key);

  @override
  State<WearingScreen> createState() => _WearingScreen();
}

class _WearingScreen extends State<WearingScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    String whatWear = '';
    Future<void> addToReport(String value) {
      return reports
          .doc('common_crime_report')
          .update({'what_wearing': value})
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
                'What were they wearing?',
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
                  hintText: 'They were wearing..',
                  alignLabelWithHint: true,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter in value';
                  }
                  whatWear = value;
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
                    addToReport(whatWear);
                    Navigator.pushNamed(context, '/ManOrWoman');
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
