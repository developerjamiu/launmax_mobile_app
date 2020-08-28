import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:launmax_app/UI/screens/payment_process/cards.dart';

class CardSelectionBuilder extends StatefulWidget {
  @override
  _CardSelectionBuilderState createState() => _CardSelectionBuilderState();
}

class _CardSelectionBuilderState extends State<CardSelectionBuilder> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            child: Container(
              margin: const EdgeInsets.only(bottom: 12.0),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: _selectedIndex == index ? Colors.grey : Colors.white,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 12.0,
                )
              ]),
              // elevation: _selectedIndex == index ?  9.9 : 0 ,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: SvgPicture.asset(
                  cards[index].imgUrl,
                  width: 33,
                  height: 33,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
