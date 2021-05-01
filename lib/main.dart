import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal1app/Modules/Cart.dart';
import 'package:meal1app/Modules/auth_firebase.dart';
import 'package:meal1app/screens/Home_Page.dart';

import 'package:meal1app/Utilities/theme_utilities.dart';
import 'package:meal1app/screens/login_Screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(child: MyApp(), providers: [
    ChangeNotifierProvider(create: (context) => Cart()),
    ChangeNotifierProvider(create: (context) => AuthProvider()),


  ],));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeProject().themeData,
      debugShowCheckedModeBanner: false,
      home: _showScreen(context),
      // HomePage(Provider.of<AuthProvider>(context).user),

    );
  }


  Widget _showScreen(context) {
    var prov = Provider.of<AuthProvider>(context);
    switch (prov.authStatus) {
      case AuthStatus.authentecating:
      case AuthStatus.unauthentecated:
        return Login();
      case AuthStatus.authentecated:
        return HomePage(Provider
            .of<AuthProvider>(context)
            .user);
    }
    return Container();
  }
}
