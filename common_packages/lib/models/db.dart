import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_packages/models/Movie.dart';
import 'package:flutter/cupertino.dart';

class DB {
  final Firestore firestore = Firestore.instance;

  CollectionReference movies = Firestore.instance.collection('movies');
  CollectionReference seates = Firestore.instance.collection('seats');

  void addMovie(
      {String movieName, String description, String img, String time}) {
    movies
        .document(movieName)
        .setData({
          'movieName': movieName,
          'time': time,
          'movieDescription': description,
          'img': img,
        })
        .then((value) => print("added"))
        .catchError((e) => print('failed cuz $e'));
  }

  void deleteMovie({String movieName}) async {
    return movies
        .document(movieName)
        .delete()
        .then((value) => print("deleted"))
        .catchError((e) => print('erorr $e'));
  }

  Future<void> book({userId, seatId, movieName}) {
    return seates
        .add({
          'userId': userId,
          'seatId': seatId,
          'movieName': movieName,
        })
        .then((value) => print("booked"))
        .catchError((e) => print('erorr $e'));
  }

  // getMovie( movieID )

  Future<List<Movie>> getMovies() async {
    final List<Movie> result = [];
    final res = await movies.getDocuments().then((QuerySnapshot querySnapshot) => {
          querySnapshot.documents.forEach((doc) => {
                result.add(
                    new Movie(
                        doc.data["movieName"],
                        doc.data["description"],
                        doc.data["img"]
                    )
                )
              })
        });
    return result;
  }

  // to do user part
}
