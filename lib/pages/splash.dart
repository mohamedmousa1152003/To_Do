import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/provider.dart';
import 'package:to_do_final/core/theme.dart';
import 'package:to_do_final/pages/home_layout/bottom_navigation.dart';

class Splash extends StatelessWidget {
  static String routeName = "Splash";

  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    });

    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(image: AssetImage( 
            // ThemeApplication.isDark  
            // ? "assets/splash – 1.png"
            // : "assets/splash.png" 
            appProvider.backgroundImage()
            ))),
    );
  }
}
