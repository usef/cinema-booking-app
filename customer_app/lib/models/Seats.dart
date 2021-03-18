import 'dart:ffi';
import 'package:flutter/material.dart';

class Seats extends StatefulWidget {
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  List<IconButton> seats = [];
  List<int> booked = [4, 5, 7, 8];
  List<int> waiting = [];
  Void SeateMaker() {
    setState(() {
      if (seats.isNotEmpty) {
        seats.clear();
      }
      for (int x = 0; x < 47; x++) {
        Color colors = Colors.white;
        if (booked.contains(x)) {
          colors = Colors.red;
        } else if (waiting.contains(x)) {
          colors = Colors.green;
        }
        seats.add(IconButton(
          icon: Icon(Icons.amp_stories),
          padding: EdgeInsets.all(0),
          color: colors,
          onPressed: () {
            if (!booked.contains(x)) {
              setState(() {
                if (waiting.contains(x)) {
                  waiting.remove(x);
                } else {
                  waiting.add(x);
                }

                print(x);
              });
            }
          },
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      booked.add(43);
    });
    SeateMaker();

    int h = 0;
    print(seats.length);
    return Column(
      children: [
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
            child: FlatButton(
              child: Text(
                'Book Movie',
                style: TextStyle(fontSize: 20.0),
              ),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                setState(() {
                  for (var s in waiting) {
                    booked.add(s);
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
