import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
// This is the theme of your application.
//
// Try running your application with "flutter run". You'll see the
// application has a blue toolbar. Then, without quitting the app, try
// changing the primarySwatch below to Colors.green and then invoke
// "hot reload" (press "r" in the console where you ran "flutter run",
// or simply save your changes to "hot reload" in a Flutter IDE).
// Notice that the counter didn't reset back to zero; the application
// is not restarted.

//brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color.fromRGBO(90, 89, 88, 100),
    fontFamily: 'RedHatText',
    textTheme: const TextTheme(bodyText2: TextStyle(fontSize: 32)),
    inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black87, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        fillColor: Color.fromRGBO(226, 226, 226, 30),
        filled: true,
        labelStyle: TextStyle(color: Colors.black54)),
  );
}
