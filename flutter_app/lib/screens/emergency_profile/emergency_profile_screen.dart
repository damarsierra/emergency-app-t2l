import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';

class EmergencyProfile extends StatefulWidget {
  const EmergencyProfile({Key? key}) : super(key: key);

  @override
  State<EmergencyProfile> createState() => _EmergencyProfileState();
}

String phoneNum = '';

class _EmergencyProfileState extends State<EmergencyProfile> {
  @override
  Widget build(BuildContext context) {
    String firstName = '';
    String lastName = '';
    int userPIN = 911;

    CollectionReference user = FirebaseFirestore.instance
        .collection('emergency_profile');

    Future<void> addUser() {
      return user
          .doc(phoneNum)
          .set({
        'firstName': firstName,
        'last_name': lastName,
        'phone_num': phoneNum,
        'user_pin': userPIN
      })
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 32, bottom: 8),
                    child: Text(
                      'Create Emergency Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color.fromRGBO(226, 226, 226, 30),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
              const Text(
                'First Name',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(226, 226, 226, 30),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Container(
                  decoration: boxDecoration(),
                  child: Form(
                    child: TextFormField(
                      key: _formKey,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: 'John',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter in your first name';
                        }
                        firstName = value;
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Last Name',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(226, 226, 226, 30),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Container(
                  decoration: boxDecoration(),
                  child: Form(
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: 'Doe',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter in your last name';
                        }
                        lastName = value;
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(226, 226, 226, 30),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Container(
                  decoration: boxDecoration(),
                  child: Form(
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: 'XXX-XXX-XXXX',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter in your phone number';
                        }
                        phoneNum = value;
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              const Text(
                'Create PIN',
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(226, 226, 226, 30),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                child: Container(
                  decoration: boxDecoration(),
                  child: Form(
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 20),
                      decoration: const InputDecoration(
                        hintText: 'XXX',
                        contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                      ),
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      obscuringCharacter: "•",
                      obscureText: true,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Create your PIN';
                        }
                        else if (value.length > 3 || value.length < 3) {
                          return 'PIN must be 3 numbers long.';
                        }
                        userPIN = value as int;
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
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Creating Profile...')),
                        );
                        addUser();
                        Navigator.pushNamed(context, '/GPSPerms');
                      }
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
      ),
    );
  }
}