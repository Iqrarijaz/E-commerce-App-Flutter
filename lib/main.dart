import 'package:flutter/material.dart';
import 'package:project1/pages/cart_page.dart';
import 'package:project1/pages/home_page.dart';
import 'package:project1/pages/login_page.dart';
import 'package:project1/utils/routes.dart';
import 'package:project1/widgets/theme.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      //light theme self defined
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        //route for login page
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.cartPageRoute: (context) => CartPage(),
      },
    );
  }
}
