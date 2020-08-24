import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ConfirmPayment extends StatelessWidget {
  final CarouselController carouselController;
  final int index;
  final bool isSuccuess = false;
  ConfirmPayment({this.carouselController, this.index});

  @override
  Widget build(BuildContext context) {
    if (isSuccuess != false) {
      return Container(

          // padding: EdgeInsets.only(top: 200),
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SvgPicture.asset(
              'assets/images/paymentFailed.svg',
              // placeholderBuilder: (context) => CircularProgressIndicator(),
              width: 200,
              height: 200.0,
            ),
          ],
        ),
      ));
    } else {
      return Container(
          // padding: EdgeInsets.only(top: 200),
          child: Center(
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            SvgPicture.asset(
              'assets/images/paymentSuccess.svg',
              // placeholderBuilder: (context) => CircularProgressIndicator(),
              width: 200,
              height: 200.0,
            ),
      
          ])));
    }
  }
}
