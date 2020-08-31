import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:launmax_app/models/phone.dart';

import 'address.dart';

enum Gender { FEMALE, MALE, NOTSAY }

class User extends ChangeNotifier {
  static const field_uid = 'uid';
  static const field_fName = 'fName';
  static const field_lName = 'lName';
  static const field_email = 'email';
  static const field_password = 'password';
  static const field_photoUrl = 'photoUrl';
  static const field_finishedReg = 'finishedReg';
  static const field_phone = 'phone';
  static const field_gender = 'gender';
  static const field_address = 'address';

  String uid;
  String fName;
  String lName;
  String email;
  String password;
  String photoUrl;
  bool finishedReg;

  Phone phone;
  Gender gender;
  Address address;

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
      field_phone: phone?.toJson(),
      field_gender: gender.toString(),
      field_address: address?.toJson(),
    };
  }

  User.fromSignUp1() {
    this.finishedReg = false;
  }

  factory User.fromSignUp2(User user) {
    user.finishedReg = true;
    return user;
  }

  factory User.fromFirebaseUser(auth.User localUser) {
    return User(
      uid: localUser.uid,
      fName: localUser.displayName != null
          ? localUser.displayName.split(" ")[0]
          : null,
      lName: localUser.displayName != null
          ? localUser.displayName.split(" ")[1]
          : null,
      email: localUser.email,
      photoUrl: localUser.photoURL,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
      uid: json['uid'] as String,
      fName: json['fName'] as String,
      lName: json['lName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      photoUrl: json['photoUrl'],
      finishedReg: json['finishedReg'] as bool);

  @override
  String toString() {
    return '$fName : $lName : $email : $password : $finishedReg';
  }
}
