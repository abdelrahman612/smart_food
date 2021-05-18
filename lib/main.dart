import 'package:flutter/material.dart';
import 'package:smart_food/screens/home.dart';
import 'package:smart_food/screens/login.dart';
import 'package:smart_food/screens/resturant_details.dart';
import 'package:smart_food/screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'smart food',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LogIn(),
        '/Home': (context) => HomeScreen(),
        '/ResturantDetails': (context) => ResturantDetails(),
      },
    );
  }
}

