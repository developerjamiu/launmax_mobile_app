import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:launmax_app/models/user.dart';

import 'auth_repository.dart';

class AppState extends ChangeNotifier {
  bool _flutterFireInitialized = false;
  auth.FirebaseAuth _firebaseAuth;
  User user = User();

  get isFlutterFireInitialized => _flutterFireInitialized;

  set flutterFireInitialized(bool value) {
    _flutterFireInitialized = value;
    if (value == true) {
      _firebaseAuth = auth.FirebaseAuth.instance;
    }
    notifyListeners();
  }

  Future initializeUser() async {
    _firebaseAuth = auth.FirebaseAuth.instance;

    // Get local user data first
    auth.User localUser = _firebaseAuth.currentUser;
    user = User.fromFirebaseUser(localUser);

    // Get cloud user data
    AuthRepository().getUser(localUser.uid).then((user) {
      this.user = user;
      notifyListeners();
    });

/*
    fName = dbUser.fName;
    lName = dbUser.lName;*/
  }
}
