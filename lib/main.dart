import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/homeScreen/homeScreen.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/utils/screen_controller.dart';
import 'package:provider/provider.dart';
import 'package:launmax_app/ui/screens/onboarding_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppState(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'LaunMax',
          theme: ThemeData(
              primarySwatch: AppColor.primaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: AppColor.background),
          home: ScreenController()
          //MyHomePage(title: 'Flutter Demo Home Page'),
          ),
    );
  }
}
