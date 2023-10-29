import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_final/core/provider.dart';
import 'package:to_do_final/pages/home_layout/bottom_navigation.dart';
import 'package:to_do_final/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'core/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => AppProvider(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppProvider>(context);
    return MaterialApp(
      title: 'Flutter To Do',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
     locale: Locale(appProvider.currentLocale),
      debugShowCheckedModeBanner: false,
      
      theme: ThemeApplication.light,
      darkTheme: ThemeApplication.dark,
      themeMode: appProvider.currentTheme,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => const Splash(),
        HomePage.routeName: (context) => HomePage(),
      },
      home: const Splash(),
    );
  }
}
