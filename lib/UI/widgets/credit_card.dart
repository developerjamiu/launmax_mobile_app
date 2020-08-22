import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launmax_app/constant.dart';

import '../../utils/cards_enum.dart';

class CreditCard extends StatelessWidget {
  final String cardHolderName;
  final String expiryDate;
  final String cardNumber;
  final CardType cardType;
  final EdgeInsetsGeometry margin;

  const CreditCard({
    Key key,
    this.margin,
    @required this.cardHolderName,
    @required this.expiryDate,
    @required this.cardType,
    @required this.cardNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      margin: margin,
      decoration: BoxDecoration(
        color: Color(0xFF135A59),
        borderRadius: BorderRadius.circular(8),
        boxShadow: kBoxShadow,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ClipPath(
            clipper: ShapeOneClipper(),
            child: Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          ClipPath(
            clipper: ShapeTwoClipper(),
            child: Container(
              height: 122,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            top: 20,
            bottom: 25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/chip.svg'),
                    Image.asset('assets/images/app_logo.png'),
                  ],
                ),
                Text(
                  '**** **** **** ${cardNumber.substring(12)}',
                  style: TextStyle(
                    fontSize: 28.0,
                    color: Colors.white,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndValue(
                      title: 'Card Holder Name',
                      value: cardHolderName,
                    ),
                    SizedBox(width: 32),
                    TitleAndValue(
                      title: 'Expiry Date',
                      value: expiryDate,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: SvgPicture.asset(
              cardImagePath(cardType),
              height: 80,
            ),
          ),
        ],
      ),
    );
  }

  String cardImagePath(CardType cardType) {
    if (cardType == CardType.visa) {
      return 'assets/images/visa.svg';
    } else if (cardType == CardType.paypal) {
      return 'assets/images/paypal.svg';
    } else if (cardType == CardType.diner) {
      return 'assets/images/diners.svg';
    } else if (cardType == CardType.amex) {
      return 'assets/images/amex.svg';
    } else {
      return 'assets/images/mastercard.svg';
    }
  }
}

class TitleAndValue extends StatelessWidget {
  final String title;
  final String value;

  const TitleAndValue({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ShapeOneClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, -20);
    var endPoint = Offset(size.width, 40);

    final path = Path()
      ..moveTo(0, 65)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  bool shouldReclip(ShapeOneClipper oldClipper) {
    return true;
  }
}

class ShapeTwoClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint = Offset(size.width / 2, -15);
    var endPoint = Offset(size.width, 15);

    final path = Path()
      ..moveTo(0, 40)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    return path;
  }

  bool shouldReclip(ShapeTwoClipper oldClipper) {
    return true;
  }
}
