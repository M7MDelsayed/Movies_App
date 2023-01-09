import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/View/home_screen.dart';

class SplashView extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Image.asset(
      'assets/images/splash.png',
      fit: BoxFit.fill,
    );
  }
}
