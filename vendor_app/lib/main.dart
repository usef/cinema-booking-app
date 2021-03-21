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
      color:Colors.red[800] ,
      debugShowCheckedModeBanner: false,
      title: 'Vendor App',
      theme: ThemeData(
        accentColor: Colors.white,
        primaryColor: Colors.black, //text color
        //backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        buttonColor: Colors.red[800],
        bottomAppBarColor: Colors.red[800],
      ),
      home: AllMoviesScreen(title: 'Vendor App'),
      initialRoute: '/AllMoviesScreen',
      routes: <String, WidgetBuilder>{
        '/AddMovieScreen': (BuildContext context) => AddMovieScreen(),
        '/MovieDetailsScreen': (BuildContext context) => MovieDetailsScreen(),
        '/AllMoviesScreen': (BuildContext context) =>
            AllMoviesScreen(title: 'Vendor App')
      },
    );
  }
}
