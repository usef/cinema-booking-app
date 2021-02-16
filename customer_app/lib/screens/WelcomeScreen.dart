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
      backgroundColor: Colors.grey[800],
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
                    color: Colors.red,
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
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RoundedButton(
              title: 'Log in',
              colour: Colors.red,
              onPressed: () {
                //Navigator.pushNamed(context, '/LoginScreen');
                // db.addMovie(
                //     description: "test",
                //     img: "text cx img ",
                //     movieName: "text ",
                //     time: "today20");
                // //db.deleteMovie("text cx app");
                // db.book(
                //   movieName: "text cx app",
                //   seatId: 2,
                //   userId: 21,
                // );

                // db.getMovies();
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.red[400],
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
