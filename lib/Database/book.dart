import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';


class BookServices {
  Firestore _firestore = Firestore.instance;
  String ref = 'Books';

  void uploadBook({String bookName, String bookStates,String bookDetails, List images, double prices}){
    var id = Uuid();
    String bookId = id.v1();

    _firestore.collection(ref).document(bookId).setData({
      'name': bookName,
      'states': bookStates,
      'details': bookDetails,
      'price': prices,
      'picture': images
    });
  }


}