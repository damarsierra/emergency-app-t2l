import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class WhenItHappenedScreen extends StatefulWidget {
  const WhenItHappenedScreen({Key? key}) : super(key: key);

  @override
  State<WhenItHappenedScreen> createState() => _WhenItHappenedScreen();
}

Color gray = const Color.fromRGBO(204, 204, 204, 255);

class _WhenItHappenedScreen extends State<WhenItHappenedScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8, 0, 1),
        lastDate: DateTime(2101, 8, 0, 1));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    // String whenHappened = '';
    // String dayHappened = '';
    Future<void> addToReport(DateTime value) {
      return reports
          .doc('common_crime_report')
          .update({'when_happened': value})
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
                'When did it happen?',
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox( height: 20.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: const Text(
                    'Select date and time',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    addToReport(selectedDate);
                    Navigator.pushNamed(context, '/WhereItHappened');
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
