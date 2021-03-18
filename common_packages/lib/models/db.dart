import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common_packages/models/Movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
class DB {
  final Firestore firestore = Firestore.instance;

  CollectionReference movies = Firestore.instance.collection('movies');
  CollectionReference seates = Firestore.instance.collection('seats');

  void addMovie(
      {String movieName, String description, String img, String time,String date}) {
    movies
        .document(movieName)
        .setData({
          'movieName': movieName,
          'time': time,
          'date': date,
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
              doc.data["movieDescription"],
              doc.data["img"],
              doc.data["time"],
              doc.data["date"]

            )
        )
      })
    });
    return result;
  }

  Stream<QuerySnapshot> getSeats(id)  {
    return  seates.where('movieName', isEqualTo: id).snapshots();
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
