import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:launmax_app/models/orders.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../styles.dart';

class OrderDetail extends StatelessWidget {
  Order order;
  OrderDetail({@required this.order});

  @override
  Widget build(BuildContext context) {
    var newDate = DateFormat("MMMM d, yyyy HH:mm a").format(order.dateTime);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Order Details',
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Card(
            elevation: 9.9,
            child: Column(
              children: [
                Container(
                    padding:
                        EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          order.statusIcon,
                          color: order.statusColor,
                        ),
                        Text(order.status,
                            style: TextStyle(color: order.statusColor,fontSize: 13)),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.06),
                        Text("$newDate"),
                      ],
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
                          style: TextStyle(
                              fontSize: 22.0, color: AppColor.primaryColor),
                        ),
                        SizedBox(height: 5.2),
                        Row(
                          children: [
                            Text('item: ',
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.grey[500])),
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
                  padding: EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "VALUE OF ITEMS ",
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[400]),
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
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey[400]),
                          ),
                          Text(
                            "${order.quantity} pairs",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 15),
                          )
                        ],
                      ),
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
                Divider(),
                Container(
                  padding: EdgeInsets.all(20.1),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "DRY CLEANER'S DETAILS\n",
                        style: TextStyle(color: Colors.grey[500], fontSize: 15),
                      ),
                      Text('Company Name: ${order.companyName}\n'),
                      Text('Delivery Man: ${order.deliveryPersonel}'),
                      Row(
                        children: [
                          Text('Phone: ${order.phoneNumber}'),
                          FlatButton.icon(
                            // color: Colors.red,
                            icon: Icon(Icons.phone), //`Icon` to display
                            label: Text('Call'), //`Text` to display
                            onPressed: () async {
                        print("tapped");
                        var url = "${order.phoneNumber}";
                        print(url);
                        launch("tel://$url");
                      },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: AppColor.primaryColor[100],
                  minWidth: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Text(
                    'Confirm collection',
                    style: TextStyle(color: Color(0xFF6BBABD)),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
