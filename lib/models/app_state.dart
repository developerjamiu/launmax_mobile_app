import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  bool _flutterFireInitialized = false;
  FirebaseAuth auth;
  User user;

  get isFlutterFireInitialized => _flutterFireInitialized;

  set flutterFireInitialized(bool value) {
    _flutterFireInitialized = value;
    if (value == true) {
      auth = FirebaseAuth.instance;
    }
    notifyListeners();
  }
}
