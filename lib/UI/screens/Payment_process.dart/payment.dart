import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/orders.dart';

import '../../../constant.dart';
import '../../../styles.dart';

class Payment extends StatelessWidget {
  final CarouselController carouselController;
  final int index;
  final Order order;

  Payment({this.carouselController, this.index, this.order});

  final bool isPayment = false;

  final double delivery_fee = 100.00;

  @override
  Widget build(BuildContext context) {
    if (isPayment) {
      return Container(
          child: Center(
              child: Column(children: [
        Text(
          'No Payment Found',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          'You can add and edit payments during checkout',
          style: TextStyle(color: Colors.grey[500]),
        ),
        Positioned(
            child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Container(
            width: double.infinity,
            height: 184,
            margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 40.0),
            decoration: BoxDecoration(
              // color: color,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColor.stroke),
              boxShadow: [kDropShadow(0, 12, 12), kDropShadow(0, 16, 24)],
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_outline,
                    size: 72,
                    color: Color(0xff41A393),
                  ),
                  SizedBox(height: 24.3),
                  Text(
                    'Add Payment Method',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ))
      ])));
      //////////////
      ///ELSE
      ////////////
    } else {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Payment',
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                ),
                MaterialButton(
                    onPressed: () {
                      print('Apc change');
                    },
                    child: Text("change", style: TextStyle(color: Colors.red)))
              ],
            ),
            Divider(),
            Container(
              child: Row(
                children: [
                  Text('Order:'),
                  Text('NGN ${order.totalCost}'),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text('Delivery:'),
                  Text('NGN $delivery_fee'),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    'Total order:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'NGN ${order.totalCost + delivery_fee} :',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }
}
