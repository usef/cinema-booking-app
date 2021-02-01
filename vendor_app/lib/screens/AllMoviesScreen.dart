import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';
import 'package:vendor_app/models/Movie.dart';

class AllMoviesScreen extends StatefulWidget {
  AllMoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  List<Movie> movies = [
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
    Movie("test", "description"),
    Movie("test2", "description2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: new Icon(
          Icons.arrow_back,
          color: Palette.secondaryColor,
        ),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('All Movies'),
            ),
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: movies == null ? 0 : movies.length,
              itemBuilder: (context, i) {
                return new FlatButton(
                  onPressed: null,
                  child: new MovieCell(movies, i, context),
                  padding: EdgeInsets.all(0.0),
                  color: Palette.secondaryColor,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.amber,
        foregroundColor: Palette.secondaryColor,
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
