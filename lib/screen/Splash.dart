import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'WelcomeScreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  late bool showSpinner;
  bool isDarkTheme = false;
  @override
  void initState() {
    super.initState();
    showSpinner = true;

    Timer(Duration(seconds: 3), () {
      setState(() {
        showSpinner = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (showSpinner == false)
      child = Welcome(
        isDarkTheme: isDarkTheme,
      onThemeChanged: (bool val) => setState(() => isDarkTheme = val),
      );
    else {
      child = SpinKitFadingCircle(
        color: Colors.black,
        size: 120.0,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: child,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Poppins',
      ),
    );
  }
}
