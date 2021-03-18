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
            child: FutureBuilder<List<Movie>>(
              future: db.getMovies(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasError)
                    return Center(child: Text('Error: ${snapshot.error}'));
                  else
                    return new ListView.builder(
                        itemCount:
                            snapshot.data == null ? 0 : snapshot.data.length,
                        itemBuilder: (context, i) {
                          return new FlatButton(
                            onPressed: null,
                            child: new MovieCell(snapshot.data, i, context),
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
          // Respond to button press
          addNewMovie();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void addNewMovie() {
    // TODO:  Switch to AddMovieScreen
    print("Calling addNewMovie..");
    // db.addMovie(
    //     description: "MovieDetail",
    //     img: "text cx img",
    //     movieName: "text 77",
    //     time: '47:11:00',
    //     date: '10/5/2070');
    Navigator.pushNamed(context, '/AddMovieScreen');
  }
}
