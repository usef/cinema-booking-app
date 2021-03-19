import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorScreen {
  String msg;

  ErrorScreen(this.msg);

  Future<void> showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: 300,
                      width: double.infinity,
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://www.freeiconspng.com/uploads/error-icon-4.png"),
                      ),
                    ),
                    // CircleAvatar(
                    //   child: Icon(Icons.error, color: Colors.red, size: 100.0),
                    // ),
                    Text(this.msg),
                  ],
                ),
                // CircleAvatar(
                //   child: Icon(Icons.error, color: Colors.red, size: 100.0),
                // ),
                // Text(this.msg),
              ],
            ),
          ),
        );
      },
    );
  }
}
