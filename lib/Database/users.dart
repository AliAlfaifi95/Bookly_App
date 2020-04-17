import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class UserServices {
  Firestore _firestore = Firestore.instance;
  FirebaseDatabase _database = FirebaseDatabase.instance;
  String ref = "users";
  createUser(Map value) {
    _database
        .reference()
        .child(ref)
        .push()
        .set(value)
        .catchError((e) => {print(e.toString())});
  }

  void uploadUser({String name, String email,String password}){
    var id = Uuid();
    String userID = id.v1();

    _firestore.collection(ref).document(userID).setData({
      'name': name,
      'email': email,
      'password': password,
    });
  }
}