import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/screens/signIn/sign_in_page.dart';
import 'package:launmax_app/ui/screens/signIn/signinViewModel.dart';
import 'package:launmax_app/utils/screen_controller.dart';
import 'package:provider/provider.dart';

void main() {
  //runApp(MyApp());
  runApp(DevicePreview(
    builder: (BuildContext context) => MyApp(),
    enabled: kReleaseMode,
  ));
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
        ChangeNotifierProvider(
          create: (_) => SigninViewModel(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'LaunMax',
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                color: Colors.white,
                iconTheme: IconThemeData(color: Colors.black),
                actionsIconTheme: IconThemeData(color: Colors.black),
                brightness: Brightness.light, // status bar brightness
              ),
              primarySwatch: AppColor.primaryColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              scaffoldBackgroundColor: AppColor.background,
              textTheme: Typography.blackCupertino
                  .copyWith(bodyText2: TextStyle(fontFamily: 'SFProText')),
            ),
            home: ScreenController());
      },
    );
  }
}
