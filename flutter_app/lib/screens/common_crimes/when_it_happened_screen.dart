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
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDay = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101, 8),
      helpText: 'Select date of the crime', // Can be used as title
      cancelText: 'Not now',
      confirmText: 'O.K.',
    );

    if (pickedDay != null && pickedDay != selectedDate) {
      setState(() {
        selectedDate = pickedDay;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      helpText: 'Select date of the crime', // Can be used as title
      cancelText: 'Not now',
      confirmText: 'O.K.',
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
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
    Future<void> addToReport(DateTime value1, TimeOfDay value2) {
      return reports
          .doc('common_crime_report')
          .update({'day_happened': value1, 'time_happened': value2})
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
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 8),
              child: Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: const TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
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
                    ' Select Date                ',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 8),
              child: Text(
                "${selectedTime.format(context)}".split(' ')[0],
                style: const TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    _selectTime(context);
                  },
                  child: const Text(
                    ' Select Time                ',
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
                    addToReport(selectedDate, selectedTime);
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
