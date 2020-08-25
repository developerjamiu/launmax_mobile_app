import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String text;
  final bool obscureText;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final TextInputType keyboardType;

  const AppTextField({
    Key key,
    this.text,
    this.controller,
    this.onChanged,
    this.obscureText,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 16),
        TextFormField(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          keyboardType: keyboardType,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: text,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            border: InputBorder.none,
            filled: false,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
