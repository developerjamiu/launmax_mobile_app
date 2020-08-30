import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/ui/screens/signIn/sign_in_page.dart';
import 'package:launmax_app/ui/widgets/app_label_button.dart';

import 'sign_up_page1.dart';
import 'sign_up_page2.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  CarouselController _carouselController = CarouselController();
  int initialPage = 1;
  int pageIndex = 0;
  Widget appBarButton;

  @override
  Widget build(BuildContext context) {
    List<Widget> authItems = [
      SignUpPage1(
        carouselController: _carouselController,
      ),
      SignUpPage2(
        carouselController: _carouselController,
      ),
      SignInPage(
        carouselController: _carouselController,
        index: pageIndex,
      ),
    ];

    onChangedFunction(int index, _) {
      setState(() {
        pageIndex = index;
        try {
          appBarButton = (authItems[index] as dynamic).appbarButton();
        } finally {}
      });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.clear, color: Colors.black),
            onPressed: () => print('cancelled')),
        actions: [
          appBarButton ??
              AppLabelButton(
                text: 'Sign in',
                onPressed: () {
                  _carouselController.animateToPage(2);
                },
              )
        ],
      ),
      body: SafeArea(
        child: CarouselSlider(
          carouselController: _carouselController,
          items: authItems.toList(),
          options: CarouselOptions(
            height: double.infinity,
            autoPlay: false,
            viewportFraction: 1.0,
            initialPage: initialPage,
            scrollPhysics: NeverScrollableScrollPhysics(),
            enableInfiniteScroll: false,
            onPageChanged: onChangedFunction,
          ),
        ),
      ),
    );
  }
}
