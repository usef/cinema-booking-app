import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class DB {
  final Firestore firestore = Firestore.instance;

  CollectionReference movies = Firestore.instance.collection('movies');

  void addMovie({String name, String des, String img}) {
    movies
        .document(name)
        .setData({
          'movieName': name,
          'movieDescription': des,
          'img': img,
          'seats': {}
        })
        .then((value) => print("added"))
        .catchError((e) => print('failed cuz $e'));
  }

  void deleteMovie(String name) async {
    return movies
        .document(name)
        .delete()
        .then((value) => print("deleted"))
        .catchError((e) => print('erorr $e'));
  }

  Future<void> book(userId, seatId, movieId) {
    return movies
        .document(movieId)
        .collection("seats")
        .add({
          "userid": userId,
          "seatid": seatId,
        })
        .then((value) => print("deleted"))
        .catchError((e) => print('erorr $e'));
  }

  // getMovie( movieID )

  // getMovies()

  // to do user part
}
