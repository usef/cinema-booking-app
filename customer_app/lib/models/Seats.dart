import 'dart:ffi';
import 'package:customer_app/models/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'package:common_packages/models/db.dart';
import 'package:flutter/services.dart';

class Seats extends StatefulWidget {
  Seats(
      {@required this.booked,
      @required this.userSeat,
      @required this.movieName});
  final List<int> booked;
  final List<int> userSeat;
  final String movieName;
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  final db = new DB();
  List<IconButton> seats = [];
  List<int> booked = [];
  List<int> userSeat = [];
  List<int> newSeat = [];
  String movie;
  Void SeateMaker() {
    setState(() {
      if (seats.isNotEmpty) {
        seats.clear();
      }
      for (int x = 0; x < 47; x++) {
        Color colors = Theme.of(context).primaryColor;
        if (booked.contains(x)) {
          colors = Colors.red;
        } else if (userSeat.contains(x)) {
          colors = Colors.green;
        } else if (newSeat.contains(x)) {
          colors = Colors.blue;
        }
        seats.add(IconButton(
          icon: Icon(Icons.event_seat),
          padding: EdgeInsets.all(0),
          color: colors,
          onPressed: () {
            if (!booked.contains(x)) {
              setState(() {
                if (newSeat.contains(x)) {
                  newSeat.remove(x);
                } else {
                  newSeat.add(x);
                }
              });
            }
          },
        ));
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movie = widget.movieName;
  }

  @override
  Widget build(BuildContext context) {
    booked = widget.booked;
    userSeat = widget.userSeat;
    SeateMaker();
    int h = 0;
    String avSeats = (47 - (booked.length + userSeat.length)).toString();

    return Column(
      children: [
        Card(
          color: Theme.of(context).buttonColor,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ListTile(
            title: Text(
              'This Is The Screen',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
            subtitle: Text(
              '$avSeats /47',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int s = 0; s < 11; s++)
              Expanded(
                child: Column(
                  children: [
                    for (int r = 0; r < 5; r++, h++)
                      s != 4 && s != 5 ? seats[h] : seats[r = h],
                  ],
                ),
              ),
          ],
        ),
        Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: RoundedButton(
              title: 'Book the seats',
              colour: Theme.of(context).buttonColor,
              onPressed: () async {
                String loggedInUser = await db.getCurrentUser();
                setState(() {
                  for (var x in newSeat) {
                    if (!booked.contains(x) && !userSeat.contains(x)) {
                      db.book(
                          seatId: x, userId: loggedInUser, movieName: movie);
                    }
                  }
                  newSeat.clear();
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
