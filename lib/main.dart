
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launmax_app/UI/forgotpassword/forgotPassword.dart';
import 'package:launmax_app/UI/signIn/signin.dart';
import 'package:launmax_app/UI/signIn/signinViewModel.dart';
import 'package:launmax_app/homeScreen/homeScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        print(snapshot.hasError);
        // Check for errors
        if (snapshot.hasError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("Sending Message"),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SigninViewModel())
      ],
          child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ForgotPassword()
      ),
    );
  }
}
