import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class SeePerpetratorScreen extends StatefulWidget {
  const SeePerpetratorScreen({Key? key}) : super(key: key);

  @override
  State<SeePerpetratorScreen> createState() => _SeePerpetratorScreen();
}

class _SeePerpetratorScreen extends State<SeePerpetratorScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    Future<void> addToReport(String perpSeen) {
      return reports
          .doc('common_crime_report')
          .update({'perpetrator_seen': perpSeen})
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
                'Did you see the perpetrator?',
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
                        addToReport('Yes');
                        Navigator.pushNamed(context, '/Wearing');
                      },
                      child: const Text(
                        'Yes',
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
                        addToReport('No');
                        Navigator.pushNamed(context, '/OtherDetails');
                      },
                      child: const Text(
                        'No',
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
    );
  }
}
