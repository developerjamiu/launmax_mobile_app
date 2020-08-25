import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:launmax_app/styles.dart';

class Constants {}

BoxShadow kDropShadow(double dx, double dy, double blurRadius,
        {color = AppColor.offset}) =>
    BoxShadow(
      offset: Offset(dx, dy),
      blurRadius: blurRadius,
      color: color,
    );

final kRoundedRectangleBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(5),
);

final kBoxShadow = <BoxShadow>[
  BoxShadow(
    offset: Offset(0, 16),
    blurRadius: 16,
    color: Colors.black26,
  )
];
