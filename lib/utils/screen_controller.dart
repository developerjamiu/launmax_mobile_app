import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/user.dart';
import 'package:launmax_app/ui/screens/auth/auth_screen.dart';
import 'package:launmax_app/ui/screens/homeScreen/home_screen.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:provider/provider.dart';

import 'AppSnackBar.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController> {
  Future<FirebaseApp> _initialization;

  @override
  void initState() {
    _initialization = Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          somethingWentWrong(snapshot.error);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          if (auth.FirebaseAuth.instance.currentUser == null) {
            // No User, show OnBoarding
            return AuthScreen();
          } else {
            Provider.of<AppState>(context, listen: false)
                .initializeUser(checkIfRegFinished: true, context: context);
          }
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return HomeScreen();
      },
    );
  }

  somethingWentWrong(error) {
    print(error);
    Scaffold.of(context).showSnackBar(AppSnackBar.error(error));
  }
}
