import 'package:flutter/material.dart';

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
    return Card(
      color: Colors.grey[500],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 80,
            child: Image(
              fit: BoxFit.fill,
              image: NetworkImage(
                  'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
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
            child: Row(
              children: [
                Material(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(50)),
                  color: Colors.red,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.edit),
                      color: Colors.white,
                      onPressed: () {
                        showMovieDetails();
                      },
                    ),
                  ),
                ),
                Material(
                  color: Colors.red,
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.white,
                      onPressed: () {
                        deleteMovie();
                      },
                    ),
                  ),
                ),
              ],
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
