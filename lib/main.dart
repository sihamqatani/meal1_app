import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal1app/screens/home_screen.dart';
import 'package:meal1app/Utilities/theme_utilities.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProject().themeData,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
