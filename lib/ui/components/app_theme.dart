import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final primaryColor = Colors.purple.shade900;
  const primaryColorLight = Colors.white;
  /* const primaryColorDark = Color.fromRGBO(96, 0, 39, 1);
 
  const secondaryColor = Color.fromRGBO(0, 77, 64, 1);
  const secondaryColorDark = Color.fromRGBO(0, 37, 26, 1);
  final disabledColor = Colors.grey[400];
  const dividerColor = Colors.grey;*/
  final textTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 30, fontWeight: FontWeight.bold, color: primaryColor),
    displayMedium: TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: primaryColor),
    displaySmall: TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: primaryColor),
  );

  /*final buttonTheme = ButtonThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      buttonColor: primaryColor,
      splashColor: primaryColorLight,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));*/
  final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontWeight: FontWeight.w900, fontSize: 22),
      backgroundColor: primaryColor,
      foregroundColor: primaryColorLight,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6)), // foreground (text) color
    ),
  );

  return ThemeData(
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    /*  primaryColorDark: primaryColorDark,
    highlightColor: secondaryColor,
    secondaryHeaderColor: secondaryColorDark,
    disabledColor: disabledColor,
    dividerColor: dividerColor,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      background: Colors.white,
    ),*/
    textTheme: textTheme,
    //buttonTheme: buttonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
  );
}
