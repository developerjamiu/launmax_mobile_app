import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/orders.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/screens/payment_process/checkout.dart';
import 'package:launmax_app/ui/screens/payment_process/payment.dart';

import 'confirm_payment.dart';

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
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: pageIndex == 0 ||
                                      pageIndex == 1 ||
                                      pageIndex == 2
                                  ? AppColor.primaryColor
                                  : Colors.white),
                          child: Text('01'),
                        ),
                        Text('Checkout'),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Text('-- -- - - -'),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: pageIndex == 1 || pageIndex == 2
                                  ? AppColor.primaryColor
                                  : Colors.white),
                          child: Text('02'),
                        ),
                        Text('Payment'),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Text('-- -- - - -'),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: pageIndex == 2
                                  ? AppColor.primaryColor
                                  : Colors.white),
                          child: Text('03'),
                        ),
                        Text('Confirm'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
