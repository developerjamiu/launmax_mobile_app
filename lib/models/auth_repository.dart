import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:launmax_app/models/user.dart';

class AuthRepository {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  Future<String> createUser(User user, {BuildContext context}) async {
    try {
      // Create Firebase user
      auth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      userCredential.user
          .updateProfile(displayName: '${user.fName} ${user.lName}');

      //
    } on auth.FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    }

    return null;
  }

  Future<User> getUser() {}
}
