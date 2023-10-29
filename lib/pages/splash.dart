import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do_final/pages/home_layout/bottom_navigation.dart';

class Splash extends StatelessWidget {
  static String routeName = "Splash";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/splash.png"))),
    );
  }
}
