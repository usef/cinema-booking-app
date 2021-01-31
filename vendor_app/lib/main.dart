import 'package:flutter/material.dart';
import 'package:vendor_app/screens/AllMoviesScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vendor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AllMoviesScreen(title: 'Vendor App'),
    );
  }
}