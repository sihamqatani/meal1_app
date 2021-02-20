import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal1app/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.red[50],
          appBarTheme: AppBarTheme(
              color: Colors.white,
              brightness: Brightness.light,
              actionsIconTheme: IconThemeData(
                color: Colors.grey[900],
              ))),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
