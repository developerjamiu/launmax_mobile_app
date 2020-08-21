import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launmax_app/UI/bottomNav.dart';
import 'package:launmax_app/UI/screens/signIn/res.dart';

final user = "John";

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Good Morning, $user!',
            style: TextStyle(
                fontSize: McGyver.textSize(context, 2),
                fontWeight: FontWeight.w300,
                color: Color(0xFFA7A7A7)),
          ),
        ),
      ),
      
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 29.0, right: 29),
            child: Row(
              children: [
                Text('What do you want \nto do today?',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF130A38))),
                SizedBox(
                  width: McGyver.rsDoubleW(context, 3),
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                )
              ],
            ),
          ),
          SizedBox(
            height: McGyver.rsDoubleH(context, 1.4),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(width: 2.0, color: Color(0xfff9f9f9)),
            )),
            child: Padding(
              padding: const EdgeInsets.only(top: 32, left: 29.0, right: 29),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 4,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: MyCards(
                      heading: "Request Pick up",
                      color: Colors.white,
                      image: 'assets/images/delivery2.svg',
                      tap: null,
                    ),
                  ),
                  SizedBox(width: McGyver.rsDoubleW(context, 7)),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 4,
                          offset: Offset(0, 7),
                        ),
                      ],
                    ),
                    child: MyCards(
                      heading: "Schedule Pick up",
                      color: Colors.white,
                      image: 'assets/images/calendar.svg',
                      tap: null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: McGyver.rsDoubleH(context, 6)),
          Padding(
            padding: const EdgeInsets.only(left: 29.0, right: 29),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0, 7),
                      ),
                    ],
                  ),
                  child: MyCards(
                    heading: "View Pricing",
                    color: Colors.white,
                    image: 'assets/images/naira.svg',
                    tap: null,
                  ),
                ),
                SizedBox(width: McGyver.rsDoubleW(context, 7)),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 10,
                        spreadRadius: 4,
                        offset: Offset(0.0, 7),
                      ),
                    ],
                  ),
                  child: MyCards(
                    heading: "Track Order",
                    color: Colors.white,
                    image: 'assets/images/delivery.svg',
                    tap: null,
                  ),
                ),
              ],
            ),
          ),
        ],
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
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topLeft: Radius.zero,
                topRight: Radius.zero)),
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
                        width: McGyver.rsDoubleW(context, 12),
                        child: SvgPicture.asset(image),
                      ),
                    ),
                    Center(
                      child: Text(
                        heading,
                        style: TextStyle(
                          fontSize: McGyver.textSize(context, 1.7),
                          fontFamily: 'SFProDisplay-Medium-1',
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: McGyver.rsDoubleH(context, 1),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
