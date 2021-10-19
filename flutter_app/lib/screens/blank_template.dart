import 'package:flutter/material.dart';

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
    final ButtonStyle bstyle = OutlinedButton.styleFrom(
      backgroundColor: const Color.fromRGBO(226, 226, 226, 30), // background
      primary: Colors.black87, //text (foreground)
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
          ],
        ),
      ),
    );
  }
}
