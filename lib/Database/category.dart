import 'package:cloud_firestore/cloud_firestore.dart';


class CategoryService {
  Firestore _firestore = Firestore.instance;
  String ref = 'Categories';

  Future<List<DocumentSnapshot>> getCategories() =>
      _firestore.collection(ref).getDocuments().then((snaps) {
        return snaps.documents;
      });


  Future<List<DocumentSnapshot>> getSuggestions(String suggestion) =>
      _firestore.collection(ref).where('Category', isEqualTo: suggestion).getDocuments().then((snap){
        return snap.documents;
      });

}