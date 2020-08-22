import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/screens/profile/profile.dart';
import 'package:launmax_app/ui/screens/signIn/res.dart';
import 'package:outline_material_icons/outline_material_icons.dart';


import 'order/track_order.dart';

final user = "John";

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _homeItems = <Widget>[
    HomePage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _selectedIndex == 0 ? HomePage.appBar() : ProfilePage.appBar(),
      body: _homeItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(OMIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  static Widget appBar() {
    return AppBar(
      bottom: buildBottomComponent(),
      elevation: 1,
      centerTitle: false,
      title: Text(
        'Good Morning, $user!',
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            color: Color(0xFFA7A7A7)),
      ),
    );
  }

  static buildBottomComponent() {
    return PreferredSize(
      preferredSize: Size.fromHeight(70),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 0, 14, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'What do you want \nto do today?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF130A38),
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 17),
      mainAxisSpacing: 50,
      crossAxisSpacing: 28,
      crossAxisCount: 2,
      children: [
        HomePageCard(
          text: "Request Pick up",
          iconPath: 'assets/images/delivery.svg',
          onTap: () {},
        ),
        HomePageCard(
          text: "Schedule Pick up",
          iconPath: 'assets/images/calendar.svg',
          onTap: () {},
        ),
        HomePageCard(
          text: "View Pricing",
          iconPath: 'assets/images/naira.svg',
          onTap: () {},
        ),
        HomePageCard(
          text: "Track Order",
          iconPath: 'assets/images/delivery2.svg',
          onTap: () {},
        ),
      ],
    );
  }
}

class HomePageCard extends StatelessWidget {
  final String text;
  final String iconPath;
  final Color color;
  final VoidCallback onTap;
  const HomePageCard({
    Key key,
    this.text,
    this.iconPath,
    this.color = Colors.white,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(16)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 16),
              blurRadius: 16,
              color: AppColor.offset,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(iconPath),
              Text(
                text,
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  static Widget appBar() {
    return AppBar(
      elevation: 1,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 18.0, top: 20),
          child: Text(
            'Edit Profile',
            style: TextStyle(
                fontWeight: FontWeight.w300, color: Color(0xff135A59)),
          ),
        )
      ],
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 93.0),
          child: Text(
            'Profile',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Color(0xff151522)),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Center(
          child: Column(
            children: [
              SizedBox(
                height: McGyver.rsDoubleH(context, 3),
              ),
              Container(
                height: McGyver.rsDoubleH(context, 12),
                width: McGyver.rsDoubleW(context, 21),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/images/avatarbig.png',
                  ),
                ),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 2),
              ),
              Text(
                'John Doe',
                style: TextStyle(
                    fontSize: McGyver.textSize(context, 2.7),
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              SizedBox(
                height: McGyver.rsDoubleH(context, 2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/marker.svg',
                    height: McGyver.rsDoubleH(context, 2.1),
                  ),
                  SizedBox(
                    width: McGyver.rsDoubleW(context, 1.8),
                  ),
                  Text(
                    'Lagos',
                    style: TextStyle(
                        fontSize: McGyver.textSize(context, 2),
                        fontWeight: FontWeight.normal,
                        color: Color(0xff787676)),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 2.4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 39.0, right: 29),
          child: Row(
            children: [
              Text(
                'MORE',
                style: TextStyle(
                    fontSize: McGyver.textSize(context, 2.0),
                    fontWeight: FontWeight.normal,
                    color: Color(0xff787676)),
              )
            ],
          ),
        ),
        SizedBox(
          height: McGyver.rsDoubleH(context, 1.4),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 29.0, right: 29),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.only(left: 0, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/card.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      trailing: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: SvgPicture.asset(
                          'assets/images/arrow.svg',
                          height: McGyver.rsDoubleH(context, 2),
                        ),
                      ),
                      title: Text(
                        'Cards',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xfffafafa)),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/refer.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'Refer a friend',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xfffafafa)),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/chat.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'Chat with us',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xfffafafa)),
                      ),
                    ),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/about.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'About us',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: SvgPicture.asset(
                          'assets/images/out.svg',
                          height: McGyver.rsDoubleH(context, 4),
                        ),
                      ),
                      title: Text(
                        'Sign out',
                        style: TextStyle(
                            fontSize: McGyver.textSize(context, 2.4),
                            fontWeight: FontWeight.normal,
                            color: Color(0xff999999)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
