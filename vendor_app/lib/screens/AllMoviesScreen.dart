import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:common_packages/models/Movie.dart';
import 'package:common_packages/models/db.dart';

class AllMoviesScreen extends StatefulWidget {
  AllMoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  final db = new DB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.red,
          onPressed: () {
            // Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          new Expanded(
            child: StreamBuilder(
              stream: db.getMoviesStream(),
              builder: Movie.moviesListBuilder,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[800],
        foregroundColor: Colors.red,
        onPressed: () {
          addNewMovie();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addNewMovie() {
    print("Calling addNewMovie..");
    Navigator.pushNamed(context, '/AddMovieScreen');
  }
}
