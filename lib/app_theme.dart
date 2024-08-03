import 'package:flutter/material.dart';

class AppTheme{
  static const Color primaryColor = Color(0xFFB7935F);
  static const Color darkPrimaryColor = Color(0xFF141A2E);
  static const Color black = Color(0xFF242424);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gold = Color(0xFFB7935F);
  static const Color grey = Colors.grey;


  static ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: black
      )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primaryColor,
      selectedItemColor: black,
      unselectedItemColor: white

    ),
    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: black,
        fontSize: 20
      ) ,
      bodyLarge: TextStyle(
        color: black,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
     
    ),

  );
    static ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimaryColor,
      appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: gold,
      )
    ),
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: darkPrimaryColor,
      selectedItemColor: gold,
      unselectedItemColor: white
    ),

    textTheme: TextTheme(
      bodySmall: TextStyle(
        color: gold,
        fontSize: 20
      ) ,
      bodyLarge: TextStyle(
        color: white,
        fontSize: 25,
        fontWeight: FontWeight.w500,
      ),
     
    ),

    );

}