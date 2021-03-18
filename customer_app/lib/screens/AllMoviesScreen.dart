import 'package:flutter/material.dart';
import 'package:common_packages/models/db.dart';
import 'package:common_packages/models/Movie.dart';

class AllMoviesScreen extends StatefulWidget {
  AllMoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
  final db = new DB();
  // List<Movie> movies = new DB().getMovies();

  // List<Movie> movies = [
  //   Movie("movies", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies1", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies2", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies3", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies4", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies5", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies6", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies7", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies8", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies9", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies10", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies11", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies12", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies13", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies14", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies15", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies16", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies17", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies19", "description",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
  //   Movie("movies20", "description2",
  //       'https://i.ytimg.com/vi/MJuFdpVCcsY/movieposter_en.jpg'),
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
            db.logout();
            Navigator.pop(context);
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
              },
            ),
          ),
        ],
      ),
    );
  }
}
