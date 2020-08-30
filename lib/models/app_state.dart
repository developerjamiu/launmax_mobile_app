import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:launmax_app/models/user.dart';

import 'auth_repository.dart';

class AppState extends ChangeNotifier {
  auth.FirebaseAuth _firebaseAuth;
  User user = User();

  Future initializeUser() async {
    _firebaseAuth = auth.FirebaseAuth.instance;

    // Get local user data first
    auth.User localUser = _firebaseAuth.currentUser;
    if (localUser != null) {
      user = User.fromFirebaseUser(localUser);

      // Get cloud user data
      await AuthRepository().getUser(localUser.uid).then((user) {
        this.user = user;

        print("initializeUser: $user)");
        notifyListeners();
      });
    }
  }
}
