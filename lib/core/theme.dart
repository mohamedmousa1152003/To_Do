import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeApplication {
  static bool isDark = false;

  static ThemeData light = ThemeData(
      primaryColor: const Color(0xFF5D9CEC),
  
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF5D9CEC),
        seedColor: const Color(0xFF5D9CEC),
        onSecondary: Colors.black,
      ),
    
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
        selectedIconTheme: IconThemeData(
          color: Color(0xFF5D9CEC),
          size: 20,
        ),
        selectedItemColor: Color(0xFF5D9CEC),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFC8C9CB),
          size: 20,
        ),
        unselectedItemColor: Color(0xFFC8C9CB),
      ),
      
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF5D9CEC),
    
      ));

  static ThemeData dark = ThemeData(
      primaryColor: const Color(0xFF5D9CEC),
    
       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor:  Color(0xFF060E1E),
        selectedIconTheme: IconThemeData(
          color: Color(0xFF5D9CEC),
          size: 20,
        ),
        selectedItemColor: Color(0xFF5D9CEC),
        unselectedIconTheme: IconThemeData(
          color: Color(0xFFC8C9CB),
          size: 20,
        ),
        unselectedItemColor: Color(0xFFC8C9CB),
      ),
       floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF5D9CEC),
    
      ),
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
            color: Colors.white,
          ),
        ),
      ),
      
  );

}
