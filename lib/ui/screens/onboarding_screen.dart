import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launmax_app/ui/screens/homeScreen.dart';

import '../widgets/custom_raised_button.dart';
import '../widgets/page_indicator.dart';
import '../widgets/page_view_items.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController _pageController;
  int currentIndex = 0;

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

  List<Widget> pages = <Widget>[
    PageViewItems(
      assetImagePath: 'assets/images/wash.png',
      title: 'Fast and Smooth Wash',
      description:
          'Experience quick and clean service from our great laundry professionals.',
    ),
    PageViewItems(
      assetImagePath: 'assets/images/pickup.png',
      title: 'Instant Pick up',
      description:
          'Request for a quick pick up or schedule a pick up at your convienient time.',
    ),
    PageViewItems(
      assetImagePath: 'assets/images/track.png',
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

  void navigateToLastPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double safeArea = MediaQuery.of(context).padding.top +
        MediaQuery.of(context).padding.bottom;
    double screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  right: 0,
                  top: 16,
                  child: InkWell(
                    onTap: navigateToNextPage,
                    child: Text(
                      'SKIP',
                      style: TextStyle(
                        color: Color(0xFF135A59),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 400,
                    child: PageView(
                      onPageChanged: onChangedFunction,
                      controller: _pageController,
                      children: pages,
                    ),
                  ),
                ),
                Positioned(
                  bottom: (screenHeight / 3.5) - safeArea,
                  right: 0,
                  left: 0,
                  child: PageIndicator(currentIndex: currentIndex),
                ),
                Positioned(
                  bottom: (screenHeight / 9) - safeArea,
                  right: 0,
                  left: 0,
                  child: CustomRaisedButton(
                    label: 'Get Started',
                    onPressed: navigateToNextPage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
