import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:metaphyc/constants/Constants.dart';
import 'package:metaphyc/models/user.dart';

class FirebaseHelper {

  void saveUser(UserClass user) {
    FirebaseFirestore.instance.collection("users")
        .doc(user.uid)
        .set({
      Constants.name: user.name,
      Constants.profilePic: user.profilePic,
      Constants.points: user.points,
      Constants.details: user.details,
      Constants.profession: user.profession,
      Constants.location: user.location,
      Constants.interests: user.interests,
      Constants.uid: user.uid
    }).then((value) => print("User Added To DB"));
  }

}
