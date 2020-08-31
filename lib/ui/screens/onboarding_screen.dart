import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launmax_app/constant.dart';
import 'package:launmax_app/styles.dart';

import '../widgets/app_raised_button.dart';
import '../widgets/page_indicator.dart';
import '../widgets/page_view_items.dart';
import 'auth/auth_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController;
  int currentIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onChangedFunction(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  bool isLastPage() => pages.length != currentIndex + 1;

  List<Widget> pages = <Widget>[
    PageViewItems(
      assetImagePath: 'assets/images/wash.svg',
      title: 'Fast and Smooth Wash',
      description:
          'Experience quick and clean service from our great laundry professionals.',
    ),
    PageViewItems(
      assetImagePath: 'assets/images/pickup.svg',
      title: 'Instant Pick up',
      description:
          'Request for a quick pick up or schedule a pick up at your convienient time.',
    ),
    PageViewItems(
      assetImagePath: 'assets/images/track.svg',
      title: 'Track Orders',
      description:
          'Monitor the progress of your laundry from pick-up to delivery.',
    ),
  ];

  void navigateToNextPage() {
    setState(() {
      _pageController.animateToPage(currentIndex + 1,
          duration: Duration(milliseconds: 400), curve: Curves.linear);
    });
  }

  void getStarted() {
    showModalBottomSheet(
      context: context,
      shape: kRoundedTopRectangleBorder,
      builder: (context) => bottomSheet,
    );
  }

  void navigateToLastPage() {
    setState(() {
      _pageController.animateToPage(pages.length - 1,
          duration: Duration(milliseconds: 600), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: isLastPage()
                    ? InkWell(
                        onTap: navigateToLastPage,
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'SKIP',
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(height: 40),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 357,
                    child: PageView(
                      onPageChanged: onChangedFunction,
                      controller: _pageController,
                      children: pages,
                    ),
                  ),
                  PageIndicator(currentIndex: currentIndex),
                ],
              ),
              isLastPage()
                  ? AppRaisedButton(
                      text: 'Next',
                      onPressed: navigateToNextPage,
                    )
                  : AppRaisedButton(
                      text: 'Get Started',
                      onPressed: getStarted,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get bottomSheet => Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: ListView(
          shrinkWrap: true, // use it
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Color(0xFFBDBDBD),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Get Started',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                color: Color(0xFF151522),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            AppRaisedButton(
              text: 'Sign in with Google',
              textColor: Colors.black54,
              prefixIcon: Image.asset(
                'assets/images/googlelogo.png',
                width: 24,
              ),
              onPressed: () {},
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            AppRaisedButton(
              text: 'Sign in with Apple',
              textColor: Colors.black54,
              prefixIcon: Image.asset(
                'assets/images/apple.png',
                width: 24,
              ),
              onPressed: () {},
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 20),
            AppRaisedButton(
              text: 'Get Started',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => AuthScreen()),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'By signing up, you agree to our Terms of Service and Privacy Policy.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Color(0xFF787676)),
            ),
            SizedBox(height: 10),
          ],
        ),
      );
}
