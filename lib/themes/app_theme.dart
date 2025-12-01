import 'package:flutter/material.dart';

class Apptheme{

  static Color? primary = Colors.deepPurpleAccent;

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    
    //tema para appbar
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      centerTitle: true,
    ),

    //tema para tipografias
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontFamily: 'Outfit',
        fontWeight: FontWeight.bold,
      ),

      bodyLarge: TextStyle(
        fontFamily: 'Outfit'
      )

    )

  );

}

