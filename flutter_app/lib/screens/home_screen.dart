import 'package:flutter/material.dart';

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
    final ButtonStyle bstyle = OutlinedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(226, 226, 226, 30),
      // background
      primary: Colors.black87,
      //text (foreground)
      textStyle: const TextStyle(
          fontFamily: 'RedHatText',
          fontWeight: FontWeight.w500,
          fontSize: 24,
          leadingDistribution: TextLeadingDistribution.even),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      minimumSize: const Size(150, 45),
      maximumSize: const Size.fromWidth(270),
      side: const BorderSide(color: Colors.black87, width: 2),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
    const BoxDecoration dbstyle = BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(37, 37, 37, 25),
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(0, 4),
        )
      ],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Row(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
                      decoration: dbstyle,
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
                      decoration: dbstyle,
                      child: OutlinedButton(
                        style: bstyle,
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
                      decoration: dbstyle,
                      child: OutlinedButton(
                        style: bstyle,
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