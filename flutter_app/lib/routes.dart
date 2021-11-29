import 'package:emergency_app_flutter/screens/success_submit/success_submit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emergency_app_flutter/screens/home/home_screen.dart';
import 'package:emergency_app_flutter/screens/gps_perms/gps_perms_screen.dart';
import 'package:emergency_app_flutter/screens/emergency_profile/emergency_profile_screen.dart';

import 'package:emergency_app_flutter/screens/stalking/armed_stalking_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/doing_currently_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/have_done_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/how_long_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/in_public_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/recognize_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/stalking_screen.dart';
import 'package:emergency_app_flutter/screens/stalking/with_anyone_screen.dart';
import 'package:emergency_app_flutter/screens/select_crime/select_crime_screen.dart';

import 'package:emergency_app_flutter/screens/common_crimes/when_it_happened_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/what_happened_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/where_it_happened_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/see_perpetrator_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/wearing_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/man_or_woman_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/age_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/height_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/race_screen.dart';
import 'package:emergency_app_flutter/screens/common_crimes/other_details_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => const HomeScreen(),
  "/GPSPerms": (BuildContext context) => const GPSPermsScreen(),
  "/NewUser": (BuildContext context) => const EmergencyProfile(),
  "/SelectCrime": (BuildContext context) => const SelectCrimeScreen(),
  "/SuccessSubmit": (BuildContext context) => const SuccessSubmitScreen(),

  "/Stalking": (BuildContext context) => const StalkingScreen(),
  "/ArmedStalking": (BuildContext context) => const ArmedStalkingScreen(),
  "/DoingCurrently": (BuildContext context) => const DoingCurrentlyScreen(),
  "/HaveDone": (BuildContext context) => const HaveDoneScreen(),
  "/HowLong": (BuildContext context) => const HowLongScreen(),
  "/InPublic": (BuildContext context) => const InPublicScreen(),
  "/Recognize": (BuildContext context) => const RecognizeScreen(),
  "/WithAnyone": (BuildContext context) => const WithAnyoneScreen(),

  "/CommonCrime": (BuildContext context) => const WhatHappenedScreen(),
  "/WhenItHappened": (BuildContext context) => const WhenItHappenedScreen(),
  "/WhereItHappened": (BuildContext context) => const WhereItHappenedScreen(),
  "/SeePerpetrator": (BuildContext context) => const SeePerpetratorScreen(),
  "/Wearing": (BuildContext context) => const WearingScreen(),
  "/ManOrWoman": (BuildContext context) => const ManOrWomanScreen(),
  "/Age": (BuildContext context) => const AgeScreen(),
  "/Height": (BuildContext context) => const HeightScreen(),
  "/Race": (BuildContext context) => const RaceScreen(),
  "/OtherDetails": (BuildContext context) => const OtherDetailsScreen(),

};
