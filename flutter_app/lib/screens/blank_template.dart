import 'package:flutter/material.dart';

import 'package:emergency_app_flutter/theme/style.dart';


//replace screen name with screens functionality (underscores to separate words)
class ScreenName extends StatefulWidget {
  const ScreenName({Key? key}) : super(key: key);

  @override
  State<ScreenName> createState() => _ScreenNameState();
}

class _ScreenNameState extends State<ScreenName> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Row( //this can be changed
          children: <Widget>[
            Flexible(
              child: Column( //this can be changed
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[ //place any widgets here in this array
                  Padding(
                    padding: EdgeInsets.only(left: 32, right:32, bottom: 16),
                    child: Text(
                      'Insert your stuffs.',
                      style: TextStyle(
                          color: Color.fromRGBO(226, 226, 226, 30),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: boxDecoration(),
                child: OutlinedButton(
                  style: buttonStyle(),
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_formKey.currentState!.validate()) {
                      // Process data.
                    }
                  },
                  child: const Text(
                    'Hello!',
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
