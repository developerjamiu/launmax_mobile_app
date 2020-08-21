
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launmax_app/UI/screens/homeScreen.dart';
import 'package:launmax_app/UI/screens/profile/profile.dart';
import 'package:launmax_app/UI/screens/signIn/res.dart';

class TheHomePage extends StatefulWidget {
  @override
  _TheHomePageState createState() => _TheHomePageState();
}

class _TheHomePageState extends State<TheHomePage> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  void _onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void _bottomTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView(
          // physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: <Widget>[
            HomeScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: CupertinoTabBar(
              onTap: _bottomTapped,
              currentIndex: _page,
              backgroundColor: Colors.white,
              items: <BottomNavigationBarItem>[
                _bottomNavigationBarItem(
                  "Home",
                  0,
                  Image.asset(
                    'assets/images/home.png',
                    height: McGyver.rsDoubleH(context, 3),
                    width: McGyver.rsDoubleW(context, 5),
                  ),
                  Image.asset(
                    'assets/images/home.png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                ),
                _bottomNavigationBarItem(
                  "Profile",
                  0,
                  Image.asset(
                    'assets/images/pro.png',
                    height: McGyver.rsDoubleH(context, 3),
                    width: McGyver.rsDoubleW(context, 5),
                  ),
                  Image.asset(
                    'assets/images/pro.png',
                    height: McGyver.rsDoubleH(context, 4),
                    width: McGyver.rsDoubleW(context, 6),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String label, int number, Widget icon, Widget activeIcon) {
    return BottomNavigationBarItem(
      activeIcon: activeIcon,
      //  backgroundColor: Colors.red,
      icon: icon,
      title: Text(label,
          style: TextStyle(
            fontSize: McGyver.textSize(context, 1.5),
            fontWeight: FontWeight.w500,
            color: Color(0xff787676),
          )),
    );
  }
}
