import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';

class MovieDetailsScreen extends StatefulWidget {
  @override
  _MovieDetailsScreenState createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
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
    );
  }
}
