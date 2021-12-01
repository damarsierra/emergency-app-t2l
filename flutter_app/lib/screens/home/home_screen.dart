import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    bool _phoneNumRegEx(String value) {
      RegExp regex1 = RegExp(
          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
      if (value.isEmpty) {
        return true;
      } else if (!regex1.hasMatch(value)) {
        return true;
      } else {
        String newStr = value.replaceAll(r'[^0-9]', '');
        phoneNum = newStr;
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

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 165, left: 32),
                  child: Text(
                    'Enter in Phone\nNumber:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color.fromRGBO(226, 226, 226, 30),
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
              child: Container(
                decoration: boxDecoration(),
                child: Form(
                  key: _formKey,
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
                      if(value != '911'){
                        if (_phoneNumRegEx(value!)) {
                          return 'Please enter in a valid phone number';
                        } else if (!(_phoneNumExist(value))) {
                          return 'Please enter in a valid phone number';
                        } else if (_phoneNumExist(value)) {
                          phoneNum = value;
                          return null;
                        }
                      } else {
                        FirebaseFirestore.instance
                            .collection('emergency_profile')
                            .add({
                          'firstName': '',
                          'last_name': '',
                          'phone_num': ''
                        }).then((DocumentReference docRef) =>
                                {phoneNum = docRef.id});
                        return null;
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
                    Navigator.pushNamed(context, '/NewUser');
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
    );
  }
}
