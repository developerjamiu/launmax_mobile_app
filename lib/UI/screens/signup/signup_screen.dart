import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/ui/screens/signup/signup(1).dart';
import 'package:launmax_app/ui/screens/signup/signup(2).dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  CarouselController _carouselController = CarouselController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.times, color: Colors.black),
            onPressed: () => print('cancelled')),
        actions: [
          FlatButton(
              onPressed: () => print('signin'),
              child: Text('Sign in',
                  style: TextStyle(color: Color(0xFF41A393), fontSize: 16)))
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                    height: double.infinity,
                    autoPlay: false,
                    viewportFraction: 1.0,
                    scrollPhysics: NeverScrollableScrollPhysics(),
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        this.pageIndex = index;
                      });
                    }),
                items: [
                  Signup1(
                    carouselController: _carouselController,
                    index: pageIndex,
                  ),
                  Signup2(
                    carouselController: _carouselController,
                    index: pageIndex,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
