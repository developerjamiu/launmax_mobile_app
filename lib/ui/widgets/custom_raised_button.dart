import 'package:flutter/material.dart';

class CustomRaisedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomRaisedButton(
      {Key key, @required this.label, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 16.0),
      ),
      textColor: Colors.white,
      color: Color(0xFF135A59),
      elevation: 0,
      padding: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    );
  }
}
