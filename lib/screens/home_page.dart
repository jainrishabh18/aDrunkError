import 'package:flutter/material.dart';
import 'package:metaphyc/models/user.dart';
import 'package:metaphyc/services/firebase_helper.dart';

class HomePage extends StatefulWidget {

  UserClass currentUser;
  HomePage({this.currentUser});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController profession = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController interests = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: profession,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Your Profession',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              TextField(
                controller: location,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Your Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              TextField(
                controller: interests,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Enter Your Interests',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              RaisedButton(
                onPressed: () {
                  widget.currentUser.profession = profession.text.toString();
                  widget.currentUser.location = location.text.toString();
                  widget.currentUser.interests = interests.text.toString();
                  FirebaseHelper().saveUser(widget.currentUser);
                },
                child: Text(
                  'Save',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
