import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_wallet/utils/theme_constant.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      textSelectionTheme: const TextSelectionThemeData(
        selectionHandleColor: Colors.transparent,
      ),
      fontFamily: 'Roboto',
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 17,
            color: placeholderColor),
        labelStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 17,
            color: primaryTextColor),
        contentPadding: EdgeInsets.all(20),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            primary: primaryTextColor,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: primaryButtonTextColor)),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: appBarColor,
          elevation: 60.0,
          titleTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white)
              .apply(fontFamily: 'Roboto')),
      textTheme: GetPlatform.isWindows
          ? const TextTheme(
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: primaryColor),
              headline2: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: primaryTextColor),
              headline3: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: primaryColor),
              headline4: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: primaryColor),
              headline5: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: primaryTextColor),
              headline6: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: primaryTextColor),
              bodyText1: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: primaryTextColor),
              subtitle2: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: primaryTextColor),
              button: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: primaryButtonTextColor),
            )
          : const TextTheme(
              headline1: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: primaryColor),
              headline2: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 26,
                  color: primaryTextColor),
              headline3: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: primaryColor),
              headline4: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  color: primaryColor),
              headline5: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: primaryTextColor),
              headline6: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: primaryTextColor),
              bodyText1: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: primaryTextColor),
              subtitle2: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: primaryTextColor),
              button: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: primaryButtonTextColor),
            ));

  
}
