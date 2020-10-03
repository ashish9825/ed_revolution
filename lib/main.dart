import 'package:ed_revolution/sections/authenticationSection/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(EDRApp());
}

class EDRApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'EdRevolution',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFFDD32A),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Poppins-Medium"
      ),
      home: LoginScreen(),
    );
  }
}
