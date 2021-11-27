import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class InPublicScreen extends StatefulWidget {
  const InPublicScreen({Key? key}) : super(key: key);

  @override
  State<InPublicScreen> createState() => _InPublicScreen();
}

class _InPublicScreen extends State<InPublicScreen> {

  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    Future<void> addToReport(String inPublic) {
      return reports
          .doc('stalking_report')
          .update({'in_public': inPublic})
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
                    padding: EdgeInsets.only(left: 32, right:32, bottom: 16),
                    child: Text(
                      'Are you in public?',
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
                              addToReport("Yes");
                              Navigator.pushNamed(context, '/WithAnyone');
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
                              addToReport("No");
                              Navigator.pushNamed(context, '/WithAnyone');
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
          ],
        ),
      ),
    );
  }
}
