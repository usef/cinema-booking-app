import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:vendor_app/Palette.dart';
import 'package:vendor_app/models/Seats.dart';
import 'package:common_packages/models/db.dart';

const String MoviePic = 'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg';

class MovieDetailsScreen extends StatelessWidget {
  final db = new DB();
  @override
  Widget build(BuildContext context) {
    final dynamic MovieDetail = ModalRoute.of(context).settings.arguments;
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
                    image: NetworkImage(MovieDetail.pic),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        color: Palette.secondaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Expanded(
                        child: Text(
                          MovieDetail.title,
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
                MovieDetail.description,
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Movie Time',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Movie Date',
                    style: TextStyle(
                      color: Colors.white,
                    ),
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
                    MovieDetail.time.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  color: Colors.white,
                  child: Text(
                    MovieDetail.date.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            StreamBuilder<QuerySnapshot>(
                stream: db.getSeats(MovieDetail.title),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final temp = snapshot.data.documents;
                  List<int> booked = [];
                  for (var x in temp) {
                    booked.add(x.data['seatId']);
                  }
                  return Seats(booked: booked);
                }),
            Center(
              child: Container(
                child: FlatButton(
                  child: Text(
                    'Delete Movie',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  color: Colors.red,
                  textColor: Colors.white,
                  onPressed: () {
                    db.deleteMovie(movieName: MovieDetail.title);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
