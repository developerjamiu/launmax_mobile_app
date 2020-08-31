import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:launmax_app/UI/screens/order/track_order.dart';
import 'package:launmax_app/UI/screens/viewPricing/viewPricing.dart';
import 'package:launmax_app/constant.dart';
import 'package:launmax_app/ui/screens/pickup/request_pickup_screen.dart';
import 'package:launmax_app/ui/screens/pickup/weekly_pickup.dart';

import 'package:launmax_app/ui/widgets/app_card.dart';

import '../../../styles.dart';

final user = "John";

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
                color: AppColor.neutralBlack,
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
          onTap: () {
            schedulePickup(context);
          },
        ),
        HomePageCard(
          text: "View Pricing",
          iconPath: 'assets/images/naira.svg',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => ViewPricing()));
          },
        ),
        HomePageCard(
          text: "Track Order",
          iconPath: 'assets/images/delivery2.svg',
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TrackOrder()));
          },
        ),
      ],
    );
  }

  void schedulePickup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: kRoundedTopRectangleBorder,
      builder: (context) => bottomSheet(context),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return Container(
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
            'Schedule Pickup',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              color: Color(0xFF151522),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => RequestPickupScreen()),
              );
            },
            title: Text(
              'One-time Pick up',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              'Schedule one-time pickup at your convenient time',
              style: TextStyle(fontSize: 12, color: Color(0xFF787676)),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          SizedBox(height: 20),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => WeeklyPickupScreen()),
              );
            },
            title: Text(
              'Weekly Pick up',
              style: TextStyle(fontSize: 18),
            ),
            subtitle: Text(
              'Setup weekly recurring pickup for your laundry',
              style: TextStyle(fontSize: 12, color: Color(0xFF787676)),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          SizedBox(height: 40),
        ],
      ),
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
    this.color,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppCard(
      radius: 16.0,
      blurRadius: 16.0,
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(iconPath),
                Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
