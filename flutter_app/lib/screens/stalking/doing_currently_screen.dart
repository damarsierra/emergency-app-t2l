import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class DoingCurrentlyScreen extends StatefulWidget {
  const DoingCurrentlyScreen({Key? key}) : super(key: key);

  @override
  State<DoingCurrentlyScreen> createState() => _DoingCurrentlyScreen();
}

class _DoingCurrentlyScreen extends State<DoingCurrentlyScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    String whatDoing = "";
    Future<void> addToReport() {
      return reports
          .doc('stalking_report')
          .update({'what_doing': whatDoing})
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
                      'What are they doing currently?',
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
                          whatDoing = "Can't respond";
                          addToReport();
                          Navigator.pushNamed(context, '/Recognize');
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
                      maxLines: 10,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'They are..',
                        alignLabelWithHint: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter in value';
                        }
                        whatDoing = value;
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
                          Navigator.pushNamed(context, '/Recognize');
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
          ],
        ),
      ),
    );
  }
}
