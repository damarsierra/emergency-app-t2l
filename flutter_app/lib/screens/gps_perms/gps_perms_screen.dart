import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

import 'package:emergency_app_flutter/theme/style.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

class GPSPermsScreen extends StatefulWidget {
  const GPSPermsScreen({Key? key}) : super(key: key);

  @override
  State<GPSPermsScreen> createState() => _GPSPermsScreenState();
}

class _GPSPermsScreenState extends State<GPSPermsScreen> {
  late Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    CollectionReference user =
        FirebaseFirestore.instance.collection('emergency_profile');

    Future<void> addLocation(GeoPoint latitude, GeoPoint longitude) {
      return user
          .doc(phoneNum)
          .update({'latitude': latitude, 'longitude': longitude})
          .then((value) => print("Info Added"))
          .catchError((error) => print("Failed to add info: $error"));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(left: 32, right: 32, bottom: 16),
                    child: Text(
                      'Are you comfortable with sharing your location?',
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
                              _getCurrentLocation();
                              addLocation(_currentPosition.latitude as GeoPoint,
                                  _currentPosition.longitude as GeoPoint);
                            },
                            child: const Text(
                              'Yes',
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
                            onPressed: () {},
                            child: const Text(
                              'No',
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
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
