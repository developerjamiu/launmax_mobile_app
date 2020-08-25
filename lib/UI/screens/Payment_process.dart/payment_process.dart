import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/checkout.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/confirm_payment.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/payment.dart';
import 'package:launmax_app/models/orders.dart';

class PaymentProcess extends StatefulWidget {
  Order order;
  PaymentProcess({@required this.order});
  @override
  _PaymentProcessState createState() => _PaymentProcessState();
}

class _PaymentProcessState extends State<PaymentProcess> {
  CarouselController _carouselController = CarouselController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        // elevation: 0.0,
        // leading: IconButton(
        //     icon: Icon(FontAwesomeIcons.times, color: Colors.black),
        //     onPressed: () => print('cancelled')),
        // actions: [
        //   FlatButton(
        //       onPressed: () => print('signin'),
        //       child: Text('Sign in',
        //           style: TextStyle(color: Color(0xFF41A393), fontSize: 16)))
        // ],
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
                  Checkout(
                    carouselController: _carouselController,
                    index: pageIndex,
                    order: widget.order,
                  ),
                  Payment(
                    carouselController: _carouselController,
                    index: pageIndex,
                    order: widget.order,
                  ),
                  ConfirmPayment(
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
