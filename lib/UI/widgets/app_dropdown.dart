import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String text;
  final String value;
  final String hintText;
  final void Function(String) onChanged;
  final String Function(String) validator;

  const AppDropdown({
    Key key,
    @required this.text,
    this.items,
    this.value,
    this.hintText,
    this.onChanged,
    this.validator,
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
        DropdownButtonFormField(
          items: items.map(
            (String item) {
              return new DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            },
          ).toList(),
          onChanged: onChanged,
          value: value,
          validator: validator,
          icon: Icon(Icons.keyboard_arrow_down),
          decoration: InputDecoration(
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
