import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';


const defaultLightColor = Colors.cyan;
const defaultDarkColor = Colors.white;
const defaultWidgetColor = Colors.lightBlueAccent;
const darkmodeColor = Color(0xFF121212);

class Themes {
  static ThemeData darkThem = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkmodeColor,
    primaryColor: defaultDarkColor,
    primarySwatch: defaultLightColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: darkmodeColor,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.white),
        backwardsCompatibility: false,
        titleTextStyle: GoogleFonts.quicksand(
            color: Colors.white, fontWeight: FontWeight.normal, fontSize: 25),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: darkmodeColor,
          statusBarIconBrightness: Brightness.light,
        )),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: defaultDarkColor),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: darkmodeColor.withOpacity(0.8),
        selectedItemColor: defaultDarkColor,
        unselectedItemColor: Colors.grey.withOpacity(0.6)),

    //NOTE : set default bodytext1
    textTheme: TextTheme(
      bodyText1: GoogleFonts.poppins(
          color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      subtitle1: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.normal),
      bodyText2: GoogleFonts.poppins(
        color: Colors.white,
      ),
      headline5:
          GoogleFonts.poppins(color: defaultDarkColor, fontWeight: FontWeight.normal),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: defaultLightColor,
    primarySwatch: defaultLightColor,
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: Colors.black),
        backwardsCompatibility: false,
        titleTextStyle: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        )),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(elevation: 10),
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: defaultLightColor),

    //NOTE : set default bodytext1
    textTheme: TextTheme(
        bodyText1: GoogleFonts.poppins(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal),
        bodyText2: GoogleFonts.poppins(
          color: Colors.black,
        ),
        subtitle1: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.normal),
        headline5:
            GoogleFonts.poppins(color: defaultLightColor, fontWeight: FontWeight.normal)),
  );
}
