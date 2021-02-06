import 'package:flutter/material.dart';
import 'package:customer_app/models/RoundedButton.dart';
import 'package:customer_app/models/CustTextfield.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String name;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
                child: IconButton(
                    icon: Icon(
                      Icons.camera_roll_outlined,
                      size: 50,
                      color: Colors.red,
                    ),
                    onPressed: null)),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'RAQ Cinema',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustTextfield(
              obscureText: false,
              hintText: 'Enter your Name',
              onChanged: (value) {
                name = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            CustTextfield(
              obscureText: false,
              hintText: 'Enter your email',
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            CustTextfield(
              obscureText: true,
              hintText: 'Enter your password',
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.red[400],
              onPressed: () {
                Navigator.pushNamed(context, '/AllMoviesScreen');
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
