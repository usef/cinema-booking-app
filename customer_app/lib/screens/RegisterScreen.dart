import 'package:flutter/material.dart';
import 'package:customer_app/models/RoundedButton.dart';
import 'package:customer_app/models/CustTextfield.dart';
import 'package:common_packages/models/db.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final db = new DB();
  String email;
  String password;
  String emailValMsg;
  String passValMsg;
  bool validate(email, password) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(email);
    /*  String pattern = r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$';
    bool passwordValid = //RegExp(pattern).hasMatch(password.trim());*/
    bool passwordValid = password.length >= 6 ? true : false;
    /*RegExp("^(?=.{8,32}\$)(?=.[A-Z])(?=.[a-z])(?=.[0-9])(?=.[!@#\$%^&(),.?:{}|<>]).")
        .hasMatch(password);*/
    if (emailValid && passwordValid) return true;
    if (!emailValid) {
      setState(() {
        emailValMsg = 'Email Not Valid';
      });
    }
    print("$passwordValid -  $password");
    if (!passwordValid) {
      setState(() {
        passValMsg = 'Password Not Valid';
      });
    }
    return false;
  }

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
            Text(emailValMsg == null ? '' : emailValMsg),
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
            Text(passValMsg == null ? '' : passValMsg),
            RoundedButton(
              title: 'Register',
              colour: Colors.red[400],
              onPressed: () async {
                /* if (!snapshot.hasData) {
                return Center(
                child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
                ),
                );*/
                if (validate(email, password)) {
                  db.AddUser(
                      email: email, password: password, context: context);
                }
              },
            ),
          ],
        ),
      ),
    );
    ;
  }
}
