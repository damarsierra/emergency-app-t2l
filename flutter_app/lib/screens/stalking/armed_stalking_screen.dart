import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

// screen name is screen's functionality (underscores to separate words)
class ArmedStalkingScreen extends StatefulWidget {
  const ArmedStalkingScreen({Key? key}) : super(key: key);

  @override
  State<ArmedStalkingScreen> createState() => _ArmedStalkingScreen();
}

class _ArmedStalkingScreen extends State<ArmedStalkingScreen> {
  @override
  Widget build(BuildContext context) {
    CollectionReference reports = FirebaseFirestore.instance
        .collection('emergency_profile')
        .doc(phoneNum)
        .collection('reports');

    Future<void> addToReport(String isArmed) {
      return reports
          .doc('stalking_report')
          .set({
            'is_armed': isArmed,
          })
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Row(
            //this can be changed
            children: <Widget>[
              Flexible(
                child: Column(
                  //this can be changed
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //place any widgets here in this array
                    const Padding(
                      padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
                      child: Text(
                        'Are they armed?',
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                decoration: boxDecoration(),
                                child: OutlinedButton(
                                  style: buttonStyle(),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/DoingCurrently');
                                    addToReport("Yes");
                                  },
                                  child: const Text(
                                    'Yes',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Container(
                                decoration: boxDecoration(),
                                child: OutlinedButton(
                                  style: buttonStyle(),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/DoingCurrently');
                                    addToReport("No");
                                  },
                                  child: const Text(
                                    'No',
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
                                  Navigator.pushNamed(
                                      context, '/DoingCurrently');
                                  addToReport("Not sure");
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
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
