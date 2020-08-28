import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launmax_app/models/orders.dart';
import 'package:launmax_app/styles.dart';

class Checkout extends StatelessWidget {
    final CarouselController carouselController;
  final int index;
  final Order order;

  Checkout({this.carouselController, this.index,this.order});
  @override
  Widget build(BuildContext context) {
    var newDate = DateFormat("MMMM d, yyyy HH:mm a").format(order.dateTime);
    return Container(
        child: Column(children: [
      Container(
        padding: EdgeInsets.all(20.1),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text(
                'Collection DETAILS',
                style: TextStyle(color: Colors.grey[500], fontSize: 15),
              ),
              MaterialButton(
                  onPressed: () {
                    print('change');
                  },
                  child: Text("change", style: TextStyle(color: Colors.red)))
            ]),
            Text('Time: $newDate\n'),
            Text('Address: ${order.deliveryAddress}'),
          ],
        ),
      ),
      Divider(),
      Container(
        padding: EdgeInsets.all(20.1),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'DELIVERY DETAILS\n',
              style: TextStyle(color: Colors.grey[500], fontSize: 15),
            ),
            Text('Time: $newDate\n'),
            Text('Address: ${order.deliveryAddress}'),
          ],
        ),
      ),
      MaterialButton(
        color: AppColor.primaryColor,
        minWidth: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.06,
        onPressed: () {
       carouselController.animateToPage(index + 1);
      },
      child: Text('Proceed',style: TextStyle(color:Colors.white),),
      ),
    
    ]));
  }
}
