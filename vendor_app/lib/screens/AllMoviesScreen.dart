import 'package:flutter/material.dart';
import 'package:vendor_app/Palette.dart';

class AllMoviesScreen extends StatefulWidget {
  AllMoviesScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _AllMoviesScreenState createState() => _AllMoviesScreenState();
}

class _AllMoviesScreenState extends State<AllMoviesScreen> {
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
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('All Movies'),
            ),
          ),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
          movieContainer(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.mainColor,
        foregroundColor: Palette.secondaryColor,
        onPressed: () {
          // Respond to button press
          addNewMovie();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Container movieContainer() {
    return Container(
      height: 50,
      color: Colors.amber[600],
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Number of seats"),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Movie Name"),
          ),
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

  void addNewMovie() {
    // TODO:  Switch to AddMovieScreen
    print("Calling addNewMovie..");
    Navigator.pushNamed(context, '/AddMovieScreen');
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
