import 'dart:ffi';
import 'package:flutter/material.dart';

class Seats extends StatefulWidget {
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  List<IconButton> seats = [];
  List<int> booked = [4, 5, 7, 8];
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
    setState(() {
      booked.add(43);
    });
    SeateMaker();
    int h = 0;
    print(seats[40]);
    print(seats.length);
    return Row(
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
    );
  }
}
