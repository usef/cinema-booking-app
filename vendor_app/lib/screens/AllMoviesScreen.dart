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
  List<Movie> movies = new DB().getMovies();

  // List<Movie> movies = [
  //   Movie("movies", "description", "pic"),
  //   Movie("movies1", "description2", "pic"),
  //   Movie("movies2", "description", "pic"),
  //   Movie("movies3", "description2", "pic"),
  //   Movie("movies4", "description", "pic"),
  //   Movie("movies5", "description2", "pic"),
  //   Movie("movies6", "description", "pic"),
  //   Movie("movies7", "description2", "pic"),
  //   Movie("movies8", "description", "pic"),
  //   Movie("movies9", "description2", "pic"),
  //   Movie("movies10", "description", "pic"),
  //   Movie("movies11", "description2", "pic"),
  //   Movie("movies12", "description", "pic"),
  //   Movie("movies13", "description2", "pic"),
  //   Movie("movies14", "description", "pic"),
  //   Movie("movies15", "description2", "pic"),
  //   Movie("movies16", "description", "pic"),
  //   Movie("movies17", "description2", "pic"),
  //   Movie("movies19", "description", "pic"),
  //   Movie("movies20", "description2", "pic"),
  // ];

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
            child: new ListView.builder(
              itemCount: movies == null ? 0 : movies.length,
              itemBuilder: (context, i) {
                return new FlatButton(
                  onPressed: null,
                  child: new MovieCell(movies, i, context),
                  padding: EdgeInsets.all(0.0),
                  color: Colors.white,
                );
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
    db.addMovie(description: "testcx", img: "text cx img ", movieName: "text cx app");
    Navigator.pushNamed(context, '/AddMovieScreen');
  }
}
