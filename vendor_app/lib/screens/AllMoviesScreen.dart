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
                builder: (context, snapshot) {
                  List snaps = snapshot.data.documents.map((e) => e.data).toList();
                  List<Movie> documents = toMovies(snaps);

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError)
                      return Center(child: Text('Error: ${snapshot.error}'));
                    else
                      return new ListView.builder(
                          itemCount:
                              documents == null ? 0 : documents.length,
                          itemBuilder: (context, i) {
                            return new FlatButton(
                              onPressed: null,
                              child: new MovieCell(documents, i, context),
                              padding: EdgeInsets.all(0.0),
                              color: Colors.white,
                            );
                          });
                  }
                },
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

  List<Movie> toMovies(list) {
    List<Movie> result = [];
    list.forEach((doc) =>
    {
          result.add(new Movie(
              doc["movieName"],
              doc["movieDescription"],
              doc["img"],
              doc["time"],
              doc["date"]))
        });
    return result;
  }
}
