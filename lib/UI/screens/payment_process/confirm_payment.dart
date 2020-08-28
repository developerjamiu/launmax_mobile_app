import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../styles.dart';

class ConfirmPayment extends StatelessWidget {
  final CarouselController carouselController;
  final int index;
  final bool isSuccuess = false;
  ConfirmPayment({this.carouselController, this.index});

  @override
  Widget build(BuildContext context) {
    if (isSuccuess == false) {
      return Container(

          // padding: EdgeInsets.only(top: 200),
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SvgPicture.asset(
              'assets/images/paymentFailed.svg',
              // placeholderBuilder: (context) => CircularProgressIndicator(),
              width: 200,
              height: 200.0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            MaterialButton(
              elevation: 0.0,
              color: AppColor.background,
              minWidth: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.06,
              onPressed: () {
                carouselController.animateToPage(index + 1);
              },
              child: Text(
                'Retry',
                style: TextStyle(color: AppColor.primaryColor),
              ),
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
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            SvgPicture.asset(
              'assets/images/paymentSuccess.svg',
              // placeholderBuilder: (context) => CircularProgressIndicator(),
              width: 200,
              height: 200.0,
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            
            MaterialButton(
              elevation: 0.0,
              color: AppColor.background,
              minWidth: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.06,
              onPressed: () {
                carouselController.animateToPage(index + 1);
              },
              child: Text(
                'Go back Home',
                style: TextStyle(color: AppColor.primaryColor),
              ),
            ),
          ])));
    }
  }
}
