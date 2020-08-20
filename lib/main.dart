import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/homeScreen/homeScreen.dart';
import 'package:launmax_app/homeScreen/styles.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final firebaseApp = Firebase.initializeApp();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: firebaseApp,
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'LaunMax',
        theme: ThemeData(
            primarySwatch: AppColor.primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            scaffoldBackgroundColor: AppColor.background),
        home: HomeScreen()
        //MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.transparent,
      ),
      body: Center(child: Container()),
    );
  }
}
