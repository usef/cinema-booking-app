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
  final _addMovieFormKey = GlobalKey<FormState>();

  DateTime _datePicked = DateTime.now(); // date is not string
  TimeOfDay _timePicked = TimeOfDay.now(); // time not string

  File _image;

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
        key: _addMovieFormKey,
        child: buildFormDetails(),
      ),
    );
  }

  Widget buildFormDetails() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          buildMovieInput(
              text: "Enter movie name",
              validator: validateMovieName,
          ),
          buildMovieInput(
            text: "Enter movie description",
            validator: validateMovieDescription,
          ),
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
                  onPressed: () async {
                    DateTime datePicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2022));
                    if (datePicked != null) _datePicked = datePicked;

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
                  onPressed: () async {
                    TimeOfDay timePicked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
                    if(timePicked != null) _timePicked = timePicked;
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
                  : Image.file(_image)
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("camera"),
                onPressed: getImageByCamera,
              ),
              ElevatedButton(
                child: Text("gallery"),
                onPressed: getImageByGallery,
              ),
            ],
          ),
          // the next widget contains submit button and action
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  await processData(addedMovie);
                },
                child: Text('Submit'),
              )),
        ],
      ),
    );
  }

  validate() async {
    if (_addMovieFormKey.currentState.validate()) {
      _timePickedToString = _timePicked.format(context);
      addedMovie.time = _timePickedToString;

      _datePickedToString = new DateFormat.yMMMd().format(_datePicked);
      addedMovie.date = _datePickedToString;

      if (_image != null) {
        String uploadedImageUrl = await uploadImage(_image);
        addedMovie.pic = uploadedImageUrl;
        return true;
      }
      return false;
    }
  }

  submit(addedMovie) async {
    return await db.addMovie(addedMovie: addedMovie) == true ? true: false;
  }

  processData(addedMovie) async {
    bool valid = await validate();
    if(valid != null && valid != false) {
      bool result = await submit(addedMovie);
      if (result)
        Navigator.pop(context);
      else
        print("Adding error");
    } else print("Validation error");
  }

  Padding buildMovieInput({ String text, validator}) {
    return Padding(
          //movie name string
            padding: const EdgeInsets.all(50),
            child: TextFormField(
              decoration:
              InputDecoration(hintText: text),
              validator: validator,
            ));
  }

  String validateMovieDescription(value) {
    if (value.isEmpty) return "please enter movie description";
    addedMovie.description = value;
    return null;
  }

  String validateMovieName(value) {
    if (value.isEmpty) return "please enter a name";
    addedMovie.title = value;
    return null;
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

  Future<String> uploadImage(var imageFile) async {
    StorageReference ref = FirebaseStorage.instance.ref().child("photo-${DateTime.now()}.jpg");
    StorageUploadTask uploadTask = ref.putFile(imageFile);

    var dowurl = await (await uploadTask.onComplete).ref.getDownloadURL();
    String url = dowurl.toString();

    return url;
  }

}
