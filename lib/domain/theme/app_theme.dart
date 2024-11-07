import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

class AppTheme {
  // Define the main color palette
  static const Color primaryColor = Color(0xFF6A0DAD); // Purple
  static const Color accentColor = Color(0xFFF4E0FF); // Teal

  static const Color textColorPrimary = Color(0xFF000000); // Black
  static const Color textColorSecondary = Color(0xFF9E9E9E); // Dark gray

  static const Color backgroundColor = Colors.white;

  static const Color buttonColor = Color(0xFF6A0DAD); // Purple

  // Define text styles
  /*
        100 - Thin
        200 - Extra Light (Ultra Light)
        300 - Light
        400 - Normal (Regular)
        500 - Medium
        600 - Semi Bold (Demi Bold)
        700 - Bold
        800 - Extra Bold (Ultra Bold)
        900 - Black (Heavy)
  */

//--------------------------------------------

  static TextStyle displayLarge = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 25.sp,
          fontWeight: FontWeight.normal,
        )
      : GoogleFonts.openSans(
          fontSize: 30.sp,
          fontWeight: FontWeight.w600,
        );

  static TextStyle displayLargePrimaryColor = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 25.sp,
          fontWeight: FontWeight.normal,
          color: primaryColor,
        )
      : GoogleFonts.openSans(
          fontSize: 30.sp,
          fontWeight: FontWeight.normal,
          color: primaryColor,
        );
//--------------------------------------------

  static TextStyle displayMediumPrimaryColor = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 21.sp,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        )
      : GoogleFonts.openSans(
          fontSize: 27.sp,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        );

  static TextStyle displayMedium = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 27.sp,
          fontWeight: FontWeight.bold,
        )
      : GoogleFonts.openSans(
          fontSize: 27.sp,
          fontWeight: FontWeight.bold,
        );

//--------------------------------------------

  static TextStyle displaySmall = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        )
      : GoogleFonts.openSans(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        );

  static TextStyle displaySmallPrimaryColor = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        )
      : GoogleFonts.openSans(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: primaryColor,
        );

//--------------------------------------------

  static TextStyle titleLarge = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        )
      : GoogleFonts.openSans(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
        );

   static TextStyle titleLargePrimaryColor = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: primaryColor
        )
      : GoogleFonts.openSans(
          fontSize: 22.sp,
          fontWeight: FontWeight.w600,
          color: primaryColor
        );

  //--------------------------------------------

  static TextStyle titleMedium = GoogleFonts.openSans(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
  );

//--------------------------------------------

  static TextStyle titleMediumGreyColor = GoogleFonts.openSans(
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
  );

//--------------------------------------------

  static TextStyle bodyLarge = GoogleFonts.openSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );

//--------------------------------------------

  static TextStyle bodyMediu = GoogleFonts.openSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.normal,
  );

//--------------------------------------------

  static TextStyle bodySmall = GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );

//--------------------------------------------

  static TextStyle bodySmallGreyCOlor = Platform.isIOS
      ? GoogleFonts.openSans(
          fontSize: 12.sp,
          fontWeight: FontWeight.normal,
          color: textColorSecondary,
        )
      : GoogleFonts.openSans(
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
          color: textColorSecondary,
        );

//--------------------------------------------

  static TextStyle labelLarge = GoogleFonts.openSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.normal,
  );

  //--------------------------------------------

  static TextStyle labelMedium = GoogleFonts.openSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  //--------------------------------------------

  static TextStyle labelSmall = GoogleFonts.openSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

//--------------------------------------------

  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMediu,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    ),

    // Button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),

    // Outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: buttonColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),

    // AppBar theme
    appBarTheme: const AppBarTheme(
      color: primaryColor,
      elevation: 4,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
  );
}
