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
    db.book(movieName: 'text 3 ', seatId: 1, userId: 88);
    db.book(movieName: 'text 3 ', seatId: 2, userId: 88);
    db.book(movieName: 'text 3 ', seatId: 3, userId: 88);
    db.book(movieName: 'text 3 ', seatId: 4, userId: 88);
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
<<<<<<< Updated upstream
            child: new ListView.builder(
              itemCount: movies == null ? 0 : movies.length,
              itemBuilder: (context, i) {
                return new FlatButton(
                  onPressed: null,
                  child: new MovieCell(movies, i, context),
                  padding: EdgeInsets.all(0.0),
                  color: Palette.secondaryColor,
                );
=======
            child: FutureBuilder<List<Movie>>(
              future: db.getMovies(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Please wait its loading...'));
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
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
    db.addMovie(
        description: "MovieDetail ",
        img: "text cx img ",
        movieName: "text 5",
        time: '21:21:20');
>>>>>>> Stashed changes
    Navigator.pushNamed(context, '/AddMovieScreen');
  }
}
