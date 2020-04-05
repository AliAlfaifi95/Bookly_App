import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bookly_app/Pages/home.dart';
import 'package:bookly_app/Pages/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _passowrd = TextEditingController();

  SharedPreferences preferences;
  bool loading = false;
  bool isLogedin = false;

  @override
  void initState() {
    super.initState();
    isSignedIn();
  }

  void isSignedIn() async {
    setState(() {
      loading = true;
    });
    
    await firebaseAuth.currentUser().then((user){
      if(user != null){
        setState(() {
          isLogedin = true;
        });
      }

    });

    preferences = await SharedPreferences.getInstance();
    // isLogedin = await googleSignIn.isSignedIn();
    if (isLogedin) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
    setState(() {
      loading = false;
    });
  }

  // Future handleSignIn() async {
  //   preferences = await SharedPreferences.getInstance();

  //   setState(() {
  //     loading = true;
  //   });

  //   GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;
  //   AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );
  //   FirebaseUser firebaseUser =
  //       (await firebaseAuth.signInWithCredential(credential)) as FirebaseUser;

  //   if (firebaseUser != null) {
  //     final QuerySnapshot result = await Firestore.instance
  //         .collection("users")
  //         .where("id", isEqualTo: firebaseUser.uid)
  //         .getDocuments();
  //     final List<DocumentSnapshot> documents = result.documents;
  //     if (documents.length == 0) {
  //       Firestore.instance
  //           .collection("users")
  //           .document(firebaseUser.uid)
  //           .setData({
  //         "id": firebaseUser.uid,
  //         "username": firebaseUser.displayName,
  //         "profilePhoto": firebaseUser.photoUrl
  //       });
  //       await preferences.setString("id", firebaseUser.uid);
  //       await preferences.setString("username", firebaseUser.displayName);
  //       await preferences.setString("photoUrl", firebaseUser.photoUrl);
  //     } else {
  //       await preferences.setString("id", documents[0]['id']);
  //       await preferences.setString("username", documents[0]['username']);
  //       await preferences.setString("photoUrl", documents[0]['photoUrl']);
  //     }
  //     Fluttertoast.showToast(msg: "Logged in");
  //     setState(() {
  //       loading = false;
  //     });
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     Fluttertoast.showToast(msg: "Login Failed.");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //HERE IS THE BG
          Image.asset(
            'images/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
         
          //Shades
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),
           //HERE IS THE LOGO
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('images/logo.png'),
          ),

          //EMAIL FORM

          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 420.0),
              child: Container(
                alignment: Alignment.center,
                child: Center(
                  child: Form(
                    key: _formkey,
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _email,
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  icon: Icon(Icons.alternate_email),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: _passowrd,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "password can't be empty";
                                  } else if (value.length < 6) {
                                    return "password must be longer than 6 charachters";
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.orangeAccent,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Divider(),
                        Text('Don`t have an account?',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.orangeAccent,
                            elevation: 0.0,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                              },
                              minWidth: MediaQuery.of(context).size.width,
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: loading ?? true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orangeAccent),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
