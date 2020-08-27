import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launmax_app/UI/screens/Payment_process.dart/cards.dart';

class CardSelectionBuilder extends StatefulWidget {
  @override
  _CardSelectionBuilderState createState() => _CardSelectionBuilderState();
}

class _CardSelectionBuilderState extends State<CardSelectionBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cards.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 9.9,
          child: SvgPicture.asset(
            cards[index].imgUrl,
            // placeholderBuilder: (context) => CircularProgressIndicator(),
            width: 200,
            height: 200.0,
          ),
        );
      },
    );
  }
}
