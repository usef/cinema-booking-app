import 'package:common_packages/models/Movie.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:common_packages/models/db.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddMovieScreen extends StatefulWidget {
  @override
  _AddMovieScreenState createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final _formKey = GlobalKey<FormState>();

  DateTime _datePicked = DateTime.now(); // date is not string
  TimeOfDay _timePicked = TimeOfDay.now(); // time not string

  File _image;

  Future _uploadedImageUrl;
  String _datePickedToString;
  String _timePickedToString;

  final picker = ImagePicker();
  final addedMovie = new Movie("", "", "", "", ""); // mmkn n4eelo

  final db = DB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" add movie "),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
                //movie name string
                padding: const EdgeInsets.all(50),
                child: TextFormField(
                  decoration:
                      const InputDecoration(hintText: 'enter the movie name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter a name";
                    }
                    addedMovie.title = value;
                    return null;
                  },
                )),
            Padding(
                // move des string
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'enter the movie description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "please enter movie description";
                    }
                    addedMovie.description = value;
                    return null;
                  },
                )),
            SizedBox(
              height: 20,
            ),
            // the next row contains pick date button and the date display
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    child: Text("pick a date"),
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2022))
                          .then((datePicked) {
                        setState(() {
                          if (datePicked != null) {
                            _datePicked = datePicked;
                            _datePickedToString =
                                new DateFormat.yMMMd().format(_datePicked);
                            addedMovie.date = _datePickedToString;
                          }
                        });
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(new DateFormat.yMMMd().format(_datePicked) != null
                      ? new DateFormat.yMMMd().format(_datePicked)
                      : "null date"), // return date as a string
                ),
              ],
            ),
            // the next row contains pick time button and the time display
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    child: Text("pick a TIME"),
                    onPressed: () {
                      showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((timePicked) {
                        setState(() {
                          if (timePicked != null) {
                            _timePicked = timePicked;
                            _timePickedToString = _timePicked.format(context);

                            addedMovie.time = _timePickedToString;
                          }
                        });
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(_timePicked.format(context) != null
                      ? _timePicked.format(context)
                      : "null"), // return date as a string
                ),
              ],
            ),
            Container(
                height: 200,
                width: 200,
                child: _image == null
                    ? Text(
                        "no image selected",
                        style: TextStyle(fontSize: 20),
                      )
                    : Image.file(_image)),
            ElevatedButton(
              child: Text("camera"),
              onPressed: getImageByCamera,
            ),
            ElevatedButton(
              child: Text("gallery"),
              onPressed: getImageByGallery,
            ),
            // the next widget contains submit button and action
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      print(addedMovie.title +
                          addedMovie.description +
                          _timePicked.format(context) +
                          new DateFormat.yMMMd().format(_datePicked));
                      if (_formKey.currentState.validate()) {
                        // Process data.
                        if (_image != null) {
                          _uploadedImageUrl = uploadImage(_image)
                              .then((res) => {addedMovie.pic = res});
                          db.addMovie(addedMovie: addedMovie);
                        }
                      }
                    },
                    child: Text('Submit'),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future getImageByCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

// need to test gallery function
  Future getImageByGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}

Future<String> uploadImage(var imageFile) async {
  StorageReference ref = FirebaseStorage.instance.ref().child("photo.jpg");
  StorageUploadTask uploadTask = ref.putFile(imageFile);

  var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
  String url = dowurl.toString();

  return url;
}

//usef code
// Container(
//       child: Material(
//         color: Palette.mainColor,
//         child: Center(
//           child: IconButton(
//             icon: Icon(Icons.arrow_back),
//             color: Palette.secondaryColor,
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//     );
