import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';

class Movie {
  String title;
  String description;

  Movie(this.title, this.description);
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  final context;
  MovieCell(this.movies, this.i, this.context);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Palette.amber,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Number of seats"),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(movies[i].title),
          ),
          Spacer(),
          Material(
            color: Palette.mainColor,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.edit),
                color: Palette.secondaryColor,
                onPressed: () {
                  showMovieDetails();
                },
              ),
            ),
          ),
          Material(
            color: Palette.mainColor,
            child: Center(
              child: IconButton(
                icon: Icon(Icons.delete),
                color: Palette.secondaryColor,
                onPressed: () {
                  deleteMovie();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void deleteMovie() {
    //  TODO: Implement delete movie function
    print("Calling deleteMovie..");
  }

  void showMovieDetails() {
    //  TODO: Switch to MovieDetailsScreen
    print("Calling showMovieDetails..");
    Navigator.pushNamed(context, '/MovieDetailsScreen');
  }
}
