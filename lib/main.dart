import 'package:HAMD/locales/strings.dart';
import 'package:HAMD/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

import 'ui/landing/landing_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.transparent.withOpacity(0),
      ),
      home: LandingScreen(),
      //home: HomeScreen(),
      translations: Strings(),
      locale: Locale("uz", "UZ"),
      fallbackLocale: Locale("uz", "UZ"),
    );
  }
}
