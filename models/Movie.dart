import 'package:flutter/material.dart';

class Movie {
  String title;
  String description;
  String pic;

  Movie(this.title, this.description, this.pic);
}

class MovieCell extends StatelessWidget {
  final movies;
  final i;
  final context;
  MovieCell(this.movies, this.i, this.context);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[500],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(movies[i].pic),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(
              movies[i].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Material(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
              color: Colors.red,
              child: Center(
                child: FlatButton(
                  onPressed: () {
                    showMovieDetails(movies[i]);
                  },
                  child: Text(
                    "Details",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showMovieDetails(dynamic movie) {
    //  TODO: Switch to MovieDetailsScreen
    print("Calling showMovieDetails..");
    Navigator.pushNamed(context, '/MovieDetailsScreen');
  }
}
