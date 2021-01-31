import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Palette.mainColor,
        child: Center(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Palette.secondaryColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );  }
}
