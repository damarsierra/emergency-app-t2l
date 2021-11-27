import 'package:flutter/material.dart';

import 'package:emergency_app_flutter/theme/style.dart';

class SuccessSubmitScreen extends StatefulWidget {
  const SuccessSubmitScreen({Key? key}) : super(key: key);

  @override
  State<SuccessSubmitScreen> createState() => _SuccessSubmitScreenState();
}

class _SuccessSubmitScreenState extends State<SuccessSubmitScreen> {

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
                'Report Submission Was Successful!'
                    ''
                    'Make another report?',
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
                        Navigator.pushNamed(context, '/SelectCrime');
                      },
                      child: const Text(
                        'Yes, I would.',
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
                        Navigator.pushNamed(context, '/');
                      },
                      child: const Text(
                        'No, take me home.',
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
