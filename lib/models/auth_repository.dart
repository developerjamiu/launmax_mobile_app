import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:launmax_app/models/user.dart';

class AuthRepository {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('user');

  auth.FirebaseAuth firebaseAuth = auth.FirebaseAuth.instance;

  Future<String> createUser(User user) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);
    } on auth.FirebaseAuthException catch (e) {
      return e.message;
    }
    return null;
  }
}
