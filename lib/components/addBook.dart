import 'dart:io';

import 'package:bookly_app/Database/book.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import '../Database/category.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bookly_app/components/books.dart' as ab;

class AddBooks extends StatefulWidget {
  @override
  _AddBooksState createState() => _AddBooksState();
}

class _AddBooksState extends State<AddBooks> {
  BookServices _bookServices = BookServices();
  CategoryService _categoryService = CategoryService();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController bookName = TextEditingController();
  TextEditingController bookState = TextEditingController();
  TextEditingController bookDetails = TextEditingController();
  TextEditingController bookPrice = TextEditingController();

  List<DocumentSnapshot> categories = <DocumentSnapshot>[];
  List<DropdownMenuItem<String>> categoriesDropDown =
      <DropdownMenuItem<String>>[];

  String _currentCategory;
  Color white = Colors.white;
  Color black = Colors.black;
  Color grey = Colors.grey;
  Color orange = Colors.orangeAccent;
  File _image1;
  File _image2;
  File _image3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: orange,
        leading: IconButton(
          icon: Icon(Icons.close,color: white),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(
          "SELL BOOK",
          style: TextStyle(color: white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery),
                                1);
                          },
                          child: _displayChild1()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                          borderSide: BorderSide(
                              color: grey.withOpacity(0.5), width: 2.5),
                          onPressed: () {
                            _selectImage(
                                ImagePicker.pickImage(
                                    source: ImageSource.gallery),
                                2);
                          },
                          child: _displayChild2()),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlineButton(
                        borderSide: BorderSide(
                            color: grey.withOpacity(0.5), width: 2.5),
                        onPressed: () {
                          _selectImage(
                              ImagePicker.pickImage(
                                  source: ImageSource.gallery),
                              3);
                        },
                        child: _displayChild3(),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'enter a book name with 20 characters at maximum',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: orange, fontSize: 12),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: bookName,
                  decoration: InputDecoration(hintText: 'Book name'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the book name';
                    } else if (value.length > 20) {
                      return 'Book name cant have more than 20 letters';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: bookState,
                  decoration: InputDecoration(hintText: 'Book States'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the book States';
                    }
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: bookDetails,
                  decoration: InputDecoration(hintText: 'Book details'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the book details';
                    } 
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: bookPrice,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: 'Book price'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'You must enter the book price';
                    } else if (value.length > 10) {
                      return 'Book price must be integer';
                    }
                  },
                ),
              ),

              FlatButton(
                color: orange,
                textColor: white,
                child: Text('add book'),
                onPressed: () {
                  validateAndUpload();
                  ab.SingleBook(bookName: bookName,bookDetails: bookDetails,bookPrice: bookPrice,bookPict: _image1,bookAuthor: "");
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  changeSelectedCategory(String selectedCategory) {
    setState(() => _currentCategory = selectedCategory);
  }

  void _selectImage(Future<File> pickImage, int imageNumber) async {
    File tempImg = await pickImage;
    switch (imageNumber) {
      case 1:
        setState(() => _image1 = tempImg);
        break;
      case 2:
        setState(() => _image2 = tempImg);
        break;
      case 3:
        setState(() => _image3 = tempImg);
        break;
    }
  }

  Widget _displayChild1() {
    if (_image1 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image1,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild2() {
    if (_image2 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image2,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  Widget _displayChild3() {
    if (_image3 == null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(14, 70, 14, 70),
        child: new Icon(
          Icons.add,
          color: grey,
        ),
      );
    } else {
      return Image.file(
        _image3,
        fit: BoxFit.fill,
        width: double.infinity,
      );
    }
  }

  void validateAndUpload() async {
    if (_formKey.currentState.validate()) {
      if (_image1 != null && _image2 != null && _image3 != null) {
        String imageUrl1;
        String imageUrl2;
        String imageUrl3;

        final FirebaseStorage storage = FirebaseStorage.instance;
        //First Image
        final String picture1 =
            "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task1 =
            storage.ref().child(picture1).putFile(_image1);
        //Second Image
        final String picture2 =
            "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task2 =
            storage.ref().child(picture2).putFile(_image2);
        //Third Image
        final String picture3 =
            "${DateTime.now().millisecondsSinceEpoch.toString()}.jpg";
        StorageUploadTask task3 =
            storage.ref().child(picture3).putFile(_image3);

        StorageTaskSnapshot snapshot1 =
            await task1.onComplete.then((snapshot) => snapshot);
        StorageTaskSnapshot snapshot2 =
            await task2.onComplete.then((snapshot) => snapshot);
        task3.onComplete.then((snapshot3) async {
          imageUrl1 = await snapshot1.ref.getDownloadURL();
          imageUrl2 = await snapshot2.ref.getDownloadURL();
          imageUrl3 = await snapshot3.ref.getDownloadURL();
          List<String> imageList = [imageUrl1, imageUrl2, imageUrl3];

          _bookServices.uploadBook(
              bookName: bookName.text,
              bookDetails: bookDetails.text,
              bookStates: bookState.text,
              images: imageList,
              prices: double.parse(bookPrice.text));
          _formKey.currentState.reset();
          Fluttertoast.showToast(msg: 'Book added');
        });
      } else {
        Fluttertoast.showToast(msg: 'all the images must be provided');
      }
    }
  }
}
