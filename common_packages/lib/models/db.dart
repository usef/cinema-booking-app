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

  Stream<QuerySnapshot> getMoviesStream() {
    return movies.snapshots();
  }

  Stream<QuerySnapshot> getSeats(id) {
    return seates.where('movieName', isEqualTo: id).snapshots();
  }

  Future<bool> AddUser({String email, String password})async{
    try {
      final newUser = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      if (newUser != null) {
        return true;
      }
    } catch (e) {
      return false;
    }
  }


  Future<bool> logUser({String email, String password}) async{

    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      if (user != null) {
        return true;
      }
    } catch (e) {
      return false;
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
