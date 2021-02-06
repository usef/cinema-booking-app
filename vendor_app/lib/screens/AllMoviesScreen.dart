import 'package:flutter/material.dart';
import 'package:vendor_app/models/Movie.dart';

class AllMoviesScreen extends StatefulWidget {
  AllMoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  List<Movie> movies = [
    Movie("movies", "description"),
    Movie("movies1", "description2"),
    Movie("movies2", "description"),
    Movie("movies3", "description2"),
    Movie("movies4", "description"),
    Movie("movies5", "description2"),
    Movie("movies6", "description"),
    Movie("movies7", "description2"),
    Movie("movies8", "description"),
    Movie("movies9", "description2"),
    Movie("movies10", "description"),
    Movie("movies11", "description2"),
    Movie("movies12", "description"),
    Movie("movies13", "description2"),
    Movie("movies14", "description"),
    Movie("movies15", "description2"),
    Movie("movies16", "description"),
    Movie("movies17", "description2"),
    Movie("movies19", "description"),
    Movie("movies20", "description2"),
  ];

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
    Navigator.pushNamed(context, '/AddMovieScreen');
  }
}
