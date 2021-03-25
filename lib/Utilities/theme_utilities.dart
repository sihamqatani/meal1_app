import 'package:flutter/material.dart';


class ThemeProject {
  ThemeData themeData = ThemeData(
      scaffoldBackgroundColor: Colors.red[50],
      appBarTheme: AppBarTheme(
          color: Colors.white,
          brightness: Brightness.light,
          actionsIconTheme: IconThemeData(
            color: Colors.grey[900],
          )));
}
