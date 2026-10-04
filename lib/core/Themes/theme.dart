import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

class AppTheme {
  static ThemeData mode = ThemeData(
    scaffoldBackgroundColor: ColorsApp.backgroundColor,

    appBarTheme: AppBarTheme(
      actionsIconTheme: IconThemeData(color: ColorsApp.actionsIconColor),
      centerTitle: true,
      backgroundColor: ColorsApp.backgroundColor,
      titleTextStyle: TextStyle(
        fontFamily: "Roboto",
        color: ColorsApp.actionsIconColor,
        fontSize: 22,
        fontWeight: .w600,
      ),
    ),

    primaryTextTheme: TextTheme(
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: .w400,
        color: ColorsApp.text,
      ),
      bodyLarge: TextStyle(
        fontSize: 22,
        fontWeight: .bold,
        color: Color(0xff1F1F1F),
      ),

      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: .w400,
        color: ColorsApp.grey,
      ),
      displayMedium: TextStyle(
        fontSize: 18,
        fontWeight: .w400,
        color: Color(0xff5C5C5C),
      ),
    ),
  );
}
