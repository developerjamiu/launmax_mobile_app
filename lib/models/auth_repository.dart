import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:launmax_app/models/user.dart';
import 'package:provider/provider.dart';

class AuthRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users_customers');

  auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  Future<String> createUser(User user, {BuildContext context}) async {
    try {
      // Create Firebase user
      auth.UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
              email: user.email, password: user.password);
      userCredential.user
          .updateProfile(displayName: '${user.fName} ${user.lName}');
      user.uid = userCredential.user.uid;

      // Upload user data
      await _usersCollection.doc(user.uid).set(user.toJson());

      // Fetch user data afresh for consumption by the whole app
      await Provider.of<AppState>(context, listen: false).initializeUser();

      print("Created User: $user");
    } on auth.FirebaseAuthException catch (e) {
      print(e);
      return e.message;
    } catch (e) {
      return 'Error: $e, Please try again later';
    }

    return null;
  }

  Future<User> getUser(String uid) async {
    try {
      DocumentSnapshot userData = await _usersCollection.doc(uid).get();
      return User.fromJson(userData.data());
    } catch (e) {
      return e.message;
    }
  }
}
