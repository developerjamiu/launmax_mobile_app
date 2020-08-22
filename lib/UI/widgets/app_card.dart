import 'package:flutter/material.dart';

import '../../styles.dart';

class AppCard extends StatelessWidget {
  final color;
  final child;
  final radius;
  final blurRadius;

  const AppCard(
      {Key key,
      this.color,
      this.child,
      this.radius = 16.0,
      this.blurRadius = 16.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, blurRadius),
            blurRadius: blurRadius,
            color: AppColor.offset,
          )
        ],
      ),
      child: child,
    );
  }
}
