import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class HaveDoneScreen extends StatefulWidget {
  const HaveDoneScreen({Key? key}) : super(key: key);

  @override
  State<HaveDoneScreen> createState() => _HaveDoneScreen();
}

class _HaveDoneScreen extends State<HaveDoneScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    String haveDone = "";
    Future<void> addToReport() {
      return reports
          .doc('stalking_report')
          .update({'have_done': haveDone})
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
                'What have they done?',
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    haveDone = "Can't respond";
                    addToReport();
                    Navigator.pushNamed(context, '/HowLong');
                    // Process data.
                  },
                  child: const Text(
                    "Can't respond",
                    textAlign: TextAlign.center,
                  ),
                ),
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
                  hintText: 'They have..',
                  alignLabelWithHint: true,
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter in value';
                  }
                  haveDone = value;
                  return null;
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
                    addToReport();
                    Navigator.pushNamed(context, '/HowLong');
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
