import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApplication {
  static ThemeData light = ThemeData(
      primaryColor: const Color(0xFF5D9CEC),
      scaffoldBackgroundColor: const Color(0xFFDFECDB),
      textTheme: TextTheme(
        // font with appBar
        titleLarge: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        // font text title
        titleMedium: GoogleFonts.poppins(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF5D9CEC),
          ),
        ),

        titleSmall: GoogleFonts.roboto(
          textStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: Color(0xFF5D9CEC),
        selectedIconTheme: IconThemeData(
          color: Color(0xFF5D9CEC),
          size: 20,
        ),
        unselectedItemColor: Color(0xFFC8C9CB),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFC8C9CB),
          size: 20,
        ),
      ));

  static ThemeData dark = ThemeData(
      textTheme: TextTheme(
    // font with appBar
    titleLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),

    // font text title
    titleMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5D9CEC),
      ),
    ),

    titleSmall: GoogleFonts.roboto(
      textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  ));
}
