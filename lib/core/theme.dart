import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApplication {
  static ThemeData light = ThemeData(
      primaryColor: const Color(0xFF5D9CEC),
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
