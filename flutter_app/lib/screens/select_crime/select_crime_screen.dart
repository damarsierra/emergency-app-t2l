import 'package:flutter/material.dart';

import 'package:emergency_app_flutter/theme/style.dart';

class SelectCrimeScreen extends StatefulWidget {
  const SelectCrimeScreen({Key? key}) : super(key: key);

  @override
  State<SelectCrimeScreen> createState() => _SelectCrimeScreenState();
}

class _SelectCrimeScreenState extends State<SelectCrimeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
              child: Text(
                'Select a crime:',
                style: TextStyle(
                    color: Color.fromRGBO(226, 226, 226, 30),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    decoration: boxDecoration(),
                    child: OutlinedButton(
                      style: buttonStyle(),
                      onPressed: () {
                        Navigator.pushNamed(context, '/Stalking');
                      },
                      child: const Text(
                        'Stalking',
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
                        Navigator.pushNamed(context, '/CommonCrime');
                      },
                      child: const Text(
                        'Common Crime',
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
