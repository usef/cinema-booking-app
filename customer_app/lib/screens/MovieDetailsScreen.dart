import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:customer_app/models/Seats.dart';
import 'package:common_packages/models/db.dart';

const String MoviePic = 'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg';

class MovieDetailsScreen extends StatelessWidget {
  final db = new DB();
  String loggedInUser;
  asyncFunc() async {
    loggedInUser = await db.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic MovieDetail = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).bottomAppBarColor,
        title: Text(MovieDetail.title),
        centerTitle: true,
      ),
      // backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        // child: Material(
        //   color: Colors.grey[900],
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  height: 300,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(MovieDetail.pic),
                    ),
                  ),
                ),
                // Container(
                //   child: Row(
                //     children: [
                //       Expanded(
                //         child: Text(
                //           MovieDetail.title,
                //           textAlign: TextAlign.center,
                //           style: TextStyle(
                //             color: Theme.of(context).primaryColor,
                //             fontWeight: FontWeight.bold,
                //             fontSize: 20.0,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   height: 100,
                // ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Text(
                MovieDetail.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
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
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Movie Date',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
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
                  asyncFunc();
                  if (!snapshot.hasData || loggedInUser == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.lightBlueAccent,
                      ),
                    );
                  }
                  final temp = snapshot.data.documents;
                  List<int> booked = [];
                  List<int> userSeats = [];
                  for (var x in temp) {
                    if (x.data['userId'] == loggedInUser) {
                      userSeats.add(x.data['seatId']);
                    } else
                      booked.add(x.data['seatId']);
                  }
                  return Seats(
                      booked: booked,
                      userSeat: userSeats,
                      movieName: MovieDetail.title);
                }),
          ],
        ),
      ),
    );
  }
}
