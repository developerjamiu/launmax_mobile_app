import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/ui/screens/signup/sign_up_page1.dart';
import 'package:launmax_app/ui/screens/signup/sign_up_page2.dart';
import 'package:launmax_app/ui/widgets/app_label_button.dart';

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
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.clear, color: Colors.black),
            onPressed: () => print('cancelled')),
        actions: [
          AppLabelButton(
            onPressed: () => print('signin'),
            text: 'Sign in',
          )
        ],
      ),
      body: SafeArea(
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
            SignUpPage1(
              carouselController: _carouselController,
              index: pageIndex,
            ),
            SignUpPage2(
              carouselController: _carouselController,
              index: pageIndex,
            ),
          ],
        ),
      ),
    );
  }
}
