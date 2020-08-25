import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/confirm_payment.dart';
import 'package:launmax_app/models/orders.dart';

import '../../../constant.dart';
import '../../../styles.dart';

class Payment extends StatelessWidget {
  final CarouselController carouselController;
  final int index;
  final Order order;

  Payment({this.carouselController, this.index, this.order});

  final bool isPayment = true;

  final double delivery_fee = 100.00;

  @override
  Widget build(BuildContext context) {
    if (isPayment != true) {
      return Container(
        padding: EdgeInsets.only(top: 200),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
            Text(
              'No Payment Found',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text(
              'You can add and edit payments during checkout',
              style: TextStyle(color: Colors.grey[500]),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                    elevation: 9.9,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(8),
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.68,
                        height: 184,
                        margin: EdgeInsets.only(
                          left: 50.0,
                          right: 50.0,
                          bottom: 50.0,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
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
                    )),
              ),
            )
          ])));
      //////////////
      ///
      ///
      ///ELSE
      ///
      ///
      ////////////
    } else {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Order:'),
                  Text('NGN ${order.totalCost}\n'),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delivery:'),
                  Text('NGN $delivery_fee\n'),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total order:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'NGN ${order.totalCost + delivery_fee}\n',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),

            MaterialButton(
              onPressed: ()=> carouselController.animateToPage(index + 1),
              child: Text('Confirm Payment'),
            ),
          ],
        ),
      );
    }
  }
}
