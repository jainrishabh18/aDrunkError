import 'dart:ffi';

import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metaphyc/models/user.dart';
import 'package:metaphyc/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    User user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;

    UserClass userClass = new UserClass(
      name: user.displayName,
      profilePic: user.photoURL,
      points: 100,
      details: "",
      profession: "",
      location: "",
      interests: "",
      uid: user.uid,
      email: user.email,
    );

    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(currentUser: userClass,)));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 100),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  image: DecorationImage(
                    image: AssetImage('assets/metaphyc.PNG')
                  ),
                ),
              ),
              GoogleAuthButton(
                onPressed: () {
                  signInWithGoogle();
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                },
                darkMode: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
