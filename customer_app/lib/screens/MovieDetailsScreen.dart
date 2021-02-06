import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:customer_app/models/Seats.dart';

const String MoviePic = 'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg';

class MovieDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Material(
        color: Colors.grey[900],
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(MoviePic),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Movie Name',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: 100,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Text(
                'MOvie discreption Example MOvie discreption Example MOvie discreption Example MOvie discreption Example  discreption Example MOvie discreption Example MOvie discreption Example MOvie discreption Example MOvie discreption Example  discreption Example',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                color: Colors.teal.shade100,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Time Of Movie',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Available Seats',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  color: Colors.white,
                  child: Text(
                    '20:20:20',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  color: Colors.white,
                  child: Text(
                    '47/47',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: ListTile(
                title: Text(
                  'This Is The Screen',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Seats(),
          ],
        ),
      ),
    );
  }
}
