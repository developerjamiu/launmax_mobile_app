import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';

enum Gender { FEMALE, MALE, NOTSAY }

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

  factory User.fromFirebaseUser(auth.User localUser) => User(
        uid: localUser.uid,
        fName: localUser.displayName.split(" ")[0],
        lName: localUser.displayName.split(" ")[1],
        email: localUser.email,
        photoUrl: localUser.photoURL,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      fName: json['fName'] as String,
      lName: json['lName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      photoUrl: json['photoUrl'] as String,
      finishedReg: json['finishedReg'] as bool);

  @override
  String toString() {
    return '$fName : $lName : $email : $password : $finishedReg';
  }
}
