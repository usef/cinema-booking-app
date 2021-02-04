import 'package:flutter/material.dart';
import 'package:customer_app/screens/WelcomeScreen.dart';
import 'package:customer_app/screens/LoginScreen.dart';
import 'package:customer_app/screens/RegisterScreen.dart';

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
      },
    );
  }
}
