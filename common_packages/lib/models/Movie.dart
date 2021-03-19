import 'package:flutter/material.dart';

class Movie {
  String title;
  String description;
  String pic;
  String time;
  String date;
  Movie(this.title, this.description, this.pic, this.time, this.date);

  static Widget moviesListBuilder(context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else {
      if (snapshot.hasError)
        return Center(child: Text('Error: ${snapshot.error}'));
      else {
        List snaps = snapshot.data.documents.map((e) => e.data).toList();
        List<Movie> documents = toMovies(snaps);

        return new ListView.builder(
            itemCount: documents == null ? 0 : documents.length,
            itemBuilder: (context, i) {
              return new FlatButton(
                onPressed: null,
                child: new MovieCell(documents, i, context),
                padding: EdgeInsets.all(0.0),
                color: Colors.white,
              );
            });
      }
    }
  }

  static List<Movie> toMovies(list) {
    List<Movie> result = [];
    list.forEach((doc) => {
      result.add(new Movie(doc["movieName"], doc["movieDescription"],
          doc["img"], doc["time"], doc["date"]))
    });
    return result;
  }
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
    Navigator.pushNamed(context, '/MovieDetailsScreen', arguments: movie);
  }
}
