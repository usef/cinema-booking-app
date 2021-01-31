import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';
import 'package:vendor_app/screens/AllMoviesScreen.dart';
import 'package:vendor_app/screens/AddMovieScreen.dart';
import 'package:vendor_app/screens/MovieDetailsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vendor App',
      theme: ThemeData(
        primarySwatch: Palette.mainColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AllMoviesScreen(title: 'Vendor App'),
      initialRoute: '/AllMoviesScreen',
      routes: <String, WidgetBuilder>{
        '/AddMovieScreen': (BuildContext context) => AddMovieScreen(),
        '/MovieDetailsScreen': (BuildContext context) => MovieDetailsScreen(),
        '/AllMoviesScreen': (BuildContext context) => AllMoviesScreen(title: 'Vendor App')
      },
    );
  }
}