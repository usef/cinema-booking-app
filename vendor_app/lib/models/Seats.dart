import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:common_packages/models/db.dart';

class Seats extends StatefulWidget {
  Seats({@required this.booked});
  final List<int> booked;
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  final db = new DB();
  List<IconButton> seats = [];
  List<int> booked = [];
  Void SeateMaker() {
    setState(() {
      if (seats.isNotEmpty) {
        seats.clear();
      }
      for (int x = 0; x < 47; x++) {
        Color colors = Colors.white;
        if (booked.contains(x)) {
          colors = Colors.red;
        }
        seats.add(IconButton(
          icon: Icon(Icons.amp_stories),
          padding: EdgeInsets.all(0),
          color: colors,
          onPressed: () {},
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    booked = widget.booked;
    SeateMaker();
    int h = 0;
    String avSeats = (47 - booked.length).toString();
    return Column(
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: ListTile(
            title: Text(
              'This Is The Screen',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '$avSeats /47',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
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
      ],
    );
  }
}
