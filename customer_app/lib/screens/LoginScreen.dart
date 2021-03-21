import 'package:customer_app/models/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:common_packages/models/RoundedButton.dart';
import 'package:customer_app/models/CustTextfield.dart';
import 'package:common_packages/models/db.dart';

import 'ErrorScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final db = new DB();
  final user = new User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                  child: IconButton(
                      icon: Icon(
                        Icons.video_collection,
                        size: 50,
                        color: Theme.of(context).buttonColor,
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
                  color: Theme.of(context).buttonColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  obscureText: false,
                  decoration:
                      const InputDecoration(hintText: 'Enter your email'),
                  validator: user.validateEmail),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                  obscureText: true,
                  decoration:
                      const InputDecoration(hintText: 'Enter your password'),
                  validator: user.validatePassword),
              RoundedButton(
                  title: 'Log in',
                  colour: Theme.of(context).buttonColor,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (user.email != null && user.password != null) {
                        bool logged = await db.logUser(
                            email: user.email, password: user.password);
                        if (logged)
                          Navigator.pushNamed(context, '/AllMoviesScreen');
                        else
                          await ErrorScreen("Login Error")
                              .showMyDialog(context);
                      }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
