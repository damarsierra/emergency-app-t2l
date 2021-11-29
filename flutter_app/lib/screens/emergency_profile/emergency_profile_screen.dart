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

    CollectionReference user =
        FirebaseFirestore.instance.collection('emergency_profile');

    Future<void> addUser() {
      return user
          .doc(phoneNum)
          .set({
            'firstName': firstName,
            'last_name': lastName,
            'phone_num': phoneNum
          })
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    bool _phoneNumRegEx(String value) {
      RegExp regex1 = RegExp(
          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
      if (value.isEmpty) {
        return true;
      } else if (!regex1.hasMatch(value)) {
        return true;
      } else {
        return false;
      }
    }

    bool _phoneNumExist(String value) {
      bool result = false;
      String newStr = value.replaceAll(r'[^0-9]', '');
      FirebaseFirestore.instance
          .collection('emergency_profile')
          .doc(newStr)
          .get()
          .then((DocumentSnapshot docSnap) {
        if (docSnap.exists) {
          result = true;
        } else {
          result = false;
        }
      });
      return result;
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
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'John',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
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
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'Doe',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
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
                  child: TextFormField(
                    textAlign: TextAlign.left,
                    style: const TextStyle(fontSize: 20),
                    decoration: const InputDecoration(
                      hintText: 'XXX-XXX-XXXX',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                    ),
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    validator: (String? value) {
                      if (_phoneNumRegEx(value!)) {
                        return 'Please enter in a valid phone number';
                      } else if (_phoneNumExist(value)) {
                        return 'Please enter in a valid phone number';
                      } else {
                        String newStr = value.replaceAll(r'[^0-9]', '');
                        phoneNum = newStr;
                        return null;
                      }
                    },
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
                        addUser();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Creating Profile...')),
                        );
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
