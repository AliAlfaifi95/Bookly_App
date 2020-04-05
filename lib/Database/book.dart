import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';


class BookServices {
  Firestore _firestore = Firestore.instance;
  String ref = 'Books';

  void uploadBook({String bookName, String bookCat,String bookStates,String bookDetails, List images, double prices}){
    var id = Uuid();
    String bookId = id.v1();

    _firestore.collection(ref).document(bookId).setData({
      'name': bookName,
      'category': bookCat,
      'states': bookStates,
      'details': bookDetails,
    });
  }


}