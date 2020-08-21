import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final user = "John";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 6,
        items: [
          BottomNavigationBarItem(
            title: Text(
              'Home',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff135A59)),
            ),
            icon: Image.asset(
              'assets/images/home.png', color: Colors.black45,
              height: 15,
              width: 15,
            ),
          ),
          BottomNavigationBarItem(
            title: Text(
              'Profile',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff135A59)),
            ),
            icon: Image.asset(
              'assets/images/pro.png', 
              height: 15,
              width: 15,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 29.0, right: 29),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 40),
            Text(
              'Good Morning, $user!',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFFA7A7A7)),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('What do you want to do today?',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF130A38))),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                )
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xfff6f6f6),
                        blurRadius: 30,
                        spreadRadius: 14,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  child: MyCards(
                    heading: "Request Pick up",
                    color: Colors.white,
                    image: 'assets/images/delivery2.png',
                    tap: null,
                  ),
                ),
                SizedBox(width: 15),
                MyCards(
                  heading: "Schedule Pick up",
                  color: Colors.white,
                  image: 'assets/images/calendar.png',
                  tap: null,
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xfff6f6f6),
                        blurRadius: 30,
                        spreadRadius: 14,
                        offset: Offset(0, 9),
                      ),
                    ],
                  ),
                  child: MyCards(
                    heading: "View Pricing",
                    color: Colors.white,
                    image: 'assets/images/naira.png',
                    tap: null,
                  ),
                ),
                SizedBox(width: 15),
                MyCards(
                  heading: "Track Order",
                  color: Colors.white,
                  image: 'assets/images/delivery.png',
                  tap: null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyCards extends StatelessWidget {
  final String heading;
  final String image;
  final Color color;
  final Function tap;
  const MyCards({
    Key key,
    this.heading,
    this.image,
    this.color,
    this.tap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: tap,
      child: Card(
        elevation: 6,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  top: 19, bottom: 6, left: 20, right: 11),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 60, bottom: 20),
                      child: Container(
                        width: 42,
                        child: Image(image: AssetImage(image), width: 15),
                      ),
                    ),
                    Center(
                      child: Text(
                        heading,
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'SFProDisplay-Medium-1',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
