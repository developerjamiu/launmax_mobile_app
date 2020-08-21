import 'package:flutter/material.dart';

class PageViewItems extends StatelessWidget {
  final String assetImagePath;
  final String title;
  final String description;

  const PageViewItems({
    Key key,
    @required this.assetImagePath,
    @required this.title,
    @required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          assetImagePath,
          width: 237,
          height: 174,
        ),
        SizedBox(height: 30.0),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0,
            color: Color(0xFF151522),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 30.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF151522),
          ),
        ),
      ],
    );
  }
}
