import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentIndex;

  PageIndicator({@required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Indicator(
          positionIndex: 0,
          currentIndex: currentIndex,
        ),
        SizedBox(
          width: 8,
        ),
        Indicator(
          positionIndex: 1,
          currentIndex: currentIndex,
        ),
        SizedBox(
          width: 8,
        ),
        Indicator(
          positionIndex: 2,
          currentIndex: currentIndex,
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final int positionIndex, currentIndex;

  const Indicator({this.currentIndex, this.positionIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: positionIndex == currentIndex
              ? Color(0xFF135A59)
              : Color(0xFFE4E4E4),
          borderRadius: BorderRadius.circular(50)),
    );
  }
}
