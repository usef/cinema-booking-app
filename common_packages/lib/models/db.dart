import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_packages/models/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';

class DB {
  final Firestore firestore = Firestore.instance;

  CollectionReference movies = Firestore.instance.collection('movies');
  CollectionReference seates = Firestore.instance.collection('seats');

  Future<bool> addMovie({Movie addedMovie}) async {
    bool res = await movies
        .document(addedMovie.title)
        .setData({
          'movieName': addedMovie.title,
          'time': addedMovie.time,
          'date': addedMovie.date,
          'movieDescription': addedMovie.description,
          'img': addedMovie.pic,
        })
        .then((value) => true)
        .catchError((e) => false);
    return res;
  }

  Future<bool> deleteMovie({String movieName}) async {
    bool res = await movies
        .document(movieName)
        .delete()
        .then((value) => true)
        .catchError((e) => false);
    return res;
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

  Stream<QuerySnapshot> getMoviesStream() {
    return movies.snapshots();
  }

  Stream<QuerySnapshot> getSeats(id) {
    return seates.where('movieName', isEqualTo: id).snapshots();
  }

  Future<void> AddUser({String username, String email, String password , context})async{
    try {
      print(email);
      print(password);
      final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      if (newUser != null) {

        Navigator.pushNamed(context, '/AllMoviesScreen');
      }
    } catch (e) {
      print(e);
    }
  }


  Future<void> logUser({String email, String password , context}) async{

    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      if (user != null) {
        Navigator.pushNamed(context, '/AllMoviesScreen');
      }

    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> getCurrentUser() async {
    String loggedInUser;
    try {
      final user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        loggedInUser = user.email;
      }
    } catch (e) {
      print(e);
    }
    return loggedInUser;
  }

  Future<void>logout() async{
    await FirebaseAuth.instance.signOut();
  }


}
