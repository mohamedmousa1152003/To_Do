import 'package:flutter/material.dart';
import 'package:to_do_final/pages/home_layout/bottom_navigation.dart';
import 'package:to_do_final/pages/splash.dart';

import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter To Do',
      debugShowCheckedModeBanner: false,
      theme: ThemeApplication.light,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        HomeLayout.routeName: (context) => HomeLayout(),
      },
      home: Splash(),
    );
  }
}
