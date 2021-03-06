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
