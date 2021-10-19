import 'package:flutter/material.dart';

import 'package:emergency_app_flutter/theme/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        child: Row(
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 165, left: 32),
                        child: Text(
                          'Enter in PIN:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Color.fromRGBO(226, 226, 226, 30),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                    child: Container(
                      decoration: boxDecoration(),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            hintText: 'XXX',
                          ),
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          obscuringCharacter: "•",
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter in your PIN';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
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
                          'Submit',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    '911 for guest',
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromRGBO(226, 226, 226, 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Container(
                      decoration: boxDecoration(),
                      child: OutlinedButton(
                        style: buttonStyle(),
                        onPressed: () {
                          // Validate will return true if the form is valid, or false if
                          // the form is invalid.
                        },
                        child: const Text(
                          'Create Emergency Profile',
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