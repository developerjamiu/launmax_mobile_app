import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String text;
  final String hintText;
  final TextInputType keyboardType;
  final bool readOnly;
  final bool obscureText;
  final Widget suffixIcon;
  final double height;
  final Function onTap;

  const FormFields({
    Key key,
    this.keyboardType,
    this.text,
    this.onTap,
    this.hintText,
    this.readOnly,
    this.height,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(alignment: Alignment.topLeft, child: Text(text)),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            onTap: onTap,
            style: TextStyle(
              height: height,
            ),
            obscureText: obscureText != null ? obscureText : false,
            keyboardType: keyboardType,
            readOnly: readOnly != null ? readOnly : false,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: Colors.white,
              hintText: hintText,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8B8B8C), width: .2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF8B8B8C), width: .2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
