import 'dart:ffi';
import 'package:flutter/material.dart';

class Seats extends StatefulWidget {
  _SeatsState createState() => _SeatsState();
}

class _SeatsState extends State<Seats> {
  List<IconButton> seats = [];
  Void SeateMaker() {
    Key k = UniqueKey();
    seats.add(IconButton(
      key: k,
      icon: Icon(Icons.amp_stories),
      padding: EdgeInsets.all(0),
      color: Colors.white,
      onPressed: () {
        onPress(k);
      },
    ));
  }

  void init_Seats() {
    if (seats.isEmpty) {
      for (int x = 0; x < 47; x++) {
        SeateMaker();
      }
    }
  }

  void onPress(Key id) {
    print('pressed $id');
  }

  bool _test = false;
  @override
  Widget build(BuildContext context) {
    int h = 0;
    init_Seats();
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
