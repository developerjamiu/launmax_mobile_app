import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/styles.dart';

import '../../constant.dart';
import '../../utils/cards_enum.dart';
import '../widgets/credit_card.dart';

class CardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: Center(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.back,
                  size: 16,
                  color: Colors.black,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        middle: Text(
          'Cards',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        trailing: Text(
          'Edit',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            color: Color(0xff135A59),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CreditCard(
              cardHolderName: 'Emily Rosser',
              cardNumber: '1234567891012123',
              cardType: CardType.diner,
              expiryDate: '05/23',
              margin: EdgeInsets.all(16.0),
            ),
            AddCard(
              margin: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 40.0),
              iconData: Icons.add_circle_outline,
              onTap: () {},
              text: 'Add New Card',
            ),
          ],
        ),
      ),
    );
  }
}

class AddCard extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color color;
  final EdgeInsetsGeometry margin;
  final VoidCallback onTap;
  const AddCard({
    Key key,
    @required this.text,
    @required this.iconData,
    @required this.onTap,
    this.margin,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 184,
        margin: margin,
        decoration: BoxDecoration(
          color: color,
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
                iconData,
                size: 72,
                color: Color(0xff41A393),
              ),
              SizedBox(height: 24.3),
              Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
