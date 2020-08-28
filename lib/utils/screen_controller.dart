import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/user.dart';
import 'package:launmax_app/ui/screens/auth/auth_screen.dart';
import 'package:launmax_app/ui/screens/homeScreen/home_screen.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:provider/provider.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      Provider.of<AppState>(context, listen: false).flutterFireInitialized =
          true;
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      Provider.of<AppState>(context, listen: false).flutterFireInitialized =
          false;
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppState>(context, listen: true).isFlutterFireInitialized) {
      if (auth.FirebaseAuth.instance.currentUser == null) {
        // No User, show OnBoarding
        //print(auth.FirebaseAuth.instance.currentUser);
        return AuthScreen();
      } else {
        Provider.of<User>(context, listen: false).initialize();
      }
    }
    return HomeScreen();
  }
}
