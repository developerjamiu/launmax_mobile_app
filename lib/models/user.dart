import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:launmax_app/models/auth_repository.dart';

enum Gender { FEMALE, MALE, NOTSAY }

auth.FirebaseAuth _firebaseAuth;

class User extends ChangeNotifier {
  String uid;
  String fName;
  String lName;
  String email;
  String password;
  String photoUrl;
  bool finishedReg;

  User(
      {this.uid,
      this.fName,
      this.lName,
      this.email,
      this.password,
      this.photoUrl,
      this.finishedReg});

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'fName': fName,
      'lName': lName,
      'email': email,
      'password': password,
      'photoUrl': photoUrl,
      'finishedReg': finishedReg,
    };
  }

  User.fromSignUp1() {
    this.finishedReg = false;
  }

  Future initialize() async {
    _firebaseAuth = auth.FirebaseAuth.instance;
    // Get local user data first
    auth.User localUser = _firebaseAuth.currentUser;
    uid = localUser.uid;
    fName = localUser.displayName.split(" ")[0];
    lName = localUser.displayName.split(" ")[1];
    email = localUser.email;
    photoUrl = localUser.photoURL;

    // Get cloud user data
    User dbUser = await AuthRepository().getUser();

    fName = dbUser.fName;
    lName = dbUser.lName;
  }

  @override
  String toString() {
    return '$fName : $lName : $email : $password : $finishedReg';
  }
}

User _PetFromJson(Map<String, dynamic> json) {
  return User(
      uid: json['uid'] as String,
      fName: json['fName'] as String,
      lName: json['name'] as String,
      email: json['name'] as String,
      password: json['name'] as String,
      photoUrl: json['name'] as String,
      finishedReg: json['finishedReg']);
}
