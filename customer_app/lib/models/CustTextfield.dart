import 'package:flutter/material.dart';

class CustTextfield extends StatelessWidget {
  CustTextfield(
      {@required this.hintText,
      @required this.obscureText,
      @required this.onChanged});
  final String hintText;
  final bool obscureText;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: obscureText,
        cursorColor: Colors.red,
        style: TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 15.0, color: Colors.white38),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.0)),
        ));
  }
}
