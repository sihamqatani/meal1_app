import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal1app/Modules/Cart.dart';
import 'package:meal1app/screens/Home_Page.dart';

import 'package:meal1app/Utilities/theme_utilities.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Cart(), child: MyApp()));

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProject().themeData,
      debugShowCheckedModeBanner: false,
      home: HomePage(),

    );
  }
}
