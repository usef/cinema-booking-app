import 'package:flutter/material.dart';
import 'package:customer_app/screens/WelcomeScreen.dart';
import 'package:customer_app/screens/LoginScreen.dart';
import 'package:customer_app/screens/RegisterScreen.dart';
import 'package:customer_app/screens/AllMoviesScreen.dart';
import 'package:customer_app/screens/MovieDetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/WelcomeScreen',
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.black, //text color
        //backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        buttonColor: Colors.red[800],
        bottomAppBarColor: Colors.red[800],
      ),
      routes: {
        '/WelcomeScreen': (context) => WelcomeScreen(),
        '/LoginScreen': (context) => LoginScreen(),
        '/RegisterScreen': (context) => RegisterScreen(),
        '/AllMoviesScreen': (BuildContext context) =>
            AllMoviesScreen(title: 'RAQ Customer App'),
        '/MovieDetailsScreen': (context) => MovieDetailsScreen(),
      },
    );
  }
}
