import 'package:flutter/widgets.dart';
import 'package:emergency_app_flutter/screens/home/home_screen.dart';
import 'package:emergency_app_flutter/screens/gps_perms/gps_perms_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => const HomeScreen(),
  "/GPSPerms": (BuildContext context) => const GPSPermsScreen(),
};
