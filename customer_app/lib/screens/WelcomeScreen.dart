import 'package:common_packages/models/db.dart';
import 'package:flutter/material.dart';
import 'package:customer_app/models/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final db = new DB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor,
          bottomOpacity: 0,
          title: Center(
            child: Text(
              "Hello!",
              style: TextStyle(color: Colors.black),
            ),
          )),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: IconButton(
                  icon: Icon(
                    Icons.camera_roll_outlined,
                    size: 50,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: null),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'RAQ Cinema',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Log in',
              colour: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.pushNamed(context, '/LoginScreen');
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Theme.of(context).accentColor,
              onPressed: () {
                Navigator.pushNamed(context, '/RegisterScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
