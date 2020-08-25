import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/card_model.dart';
import 'package:launmax_app/styles.dart';

import '../../../constant.dart';
import '../../widgets/credit_card.dart';

/// To switch between Cards and No Cards Screen
/// Go to Card Model and uncomment to Card Models

/// The Screen looks cool on one card but I don't really think it
/// look good on multiple card. Maybe there can be another
/// UI for cases when there are more than one cards

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
            Expanded(
              child: creditCards.isEmpty
                  ? Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'No Card Found',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Add new card to enable payment method on your account',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: creditCards
                          .map(
                            (CardModel creditCard) => CreditCard(
                              cardHolderName: creditCard.cardHolderName,
                              cardNumber: creditCard.cardNumber,
                              cardType: creditCard.cardType,
                              expiryDate: creditCard.expiryDate,
                              margin: EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 16.0),
                            ),
                          )
                          .toList(),
                    ),
            ),
            AddCard(
              margin: EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 40.0, top: 16.0),
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
          boxShadow: [
            kDropShadow(0, 12, 12),
            kDropShadow(0, 16, 24),
          ],
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
