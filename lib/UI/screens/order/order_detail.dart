import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launmax_app/models/orders.dart';

import '../../../styles.dart';

class OrderDetail extends StatelessWidget {
  Order order;
  OrderDetail({@required this.order});

  @override
  Widget build(BuildContext context) {
    var newDate = DateFormat("MMMM d, yyyy HH:mm a").format(order.dateTime);
    return Scaffold(backgroundColor: Colors.white,

          appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){Navigator.pop(context);}),
        title: Text(
          'Order Details',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20,color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
          elevation: 9.9,
            child: Column(
          children: [
            Container(
                child: Row(
              children: [],
            )),
            Divider(),
            Container(
              padding: EdgeInsets.all(20.1),
              alignment: Alignment.centerLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Order No̲${order.orderNo}",
                      style:
                          TextStyle(fontSize: 25.0, color: AppColor.primaryColor),
                    ),
                    Row(
                      children: [
                        Text('item: ',
                            style: TextStyle(
                                fontSize: 17.0, color: Colors.grey[300])),
                        Expanded(
                          child: Text(
                              '${order.items.reduce((v, e) => v + ',' + e)}',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  color: AppColor.primaryColor[600])),
                        ),
                      ],
                    ),
                  ]),
            ),
            Divider(),
            Container(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "VALUE OF ITEMS ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                      ),
                      Text(
                        "NGN ${order.totalCost}",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "QUANTITY ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[400]),
                      ),
                      Text(
                        "${order.quantity}",
                        style:
                            TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            Container(
              child: Column(
                children: [
                  Text('DELIVERY DETAILS'),
                  Text('Time: $newDate'),
                  Text('Address: ${order.deliveryAddress}'),
                ],
              ),
            ),
            Divider(),
            Container(
              child: Column(
                children: [
                  Text("DRY CLEANER'S DETAILS"),
                  Text('Company Name: ${order.companyName}'),
                  Text('Delivery Man: ${order.deliveryPersonel}'),
                  Row(
                    children: [
                      Text('Phone Number: ${order.phoneNumber}'),
                      FlatButton.icon(
                        color: Colors.red,
                        icon: Icon(Icons.phone), //`Icon` to display
                        label: Text('Call'), //`Text` to display
                        onPressed: () {
                         
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
