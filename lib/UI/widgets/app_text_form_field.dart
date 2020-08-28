import 'package:flutter/material.dart';
import 'package:launmax_app/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    this.autofocus = false,
    this.readOnly = false,
    this.onChanged,
    this.initialValue,
    this.label,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.controller,
    this.validator,
    this.height,
    this.hintColor,
    this.borderWidth,
    this.onTap,
    this.onSaved,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.autovalidate = false,
  });

  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Color hintColor;
  final TextEditingController controller;
  final double borderWidth;
  final double height;
  final Function(String) validator;
  final Function onSaved;
  final Function onTap;
  final FocusNode focusNode;
  final TextInputAction textInputAction;
  final Function onFieldSubmitted;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String label;
  final String initialValue;
  final Function onChanged;
  final bool readOnly;
  final bool autofocus;
  final bool autovalidate;

  @override
  Widget build(BuildContext context) {
    TextFormField textFormField = TextFormField(
      readOnly: readOnly,
      autovalidate: autovalidate,
      onChanged: onChanged,
      initialValue: initialValue,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller != null ? controller : null,
      focusNode: focusNode,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autofocus: autofocus,
      style: Theme.of(context).textTheme.bodyText2.copyWith(
            fontWeight: FontWeight.w600,
          ),
      validator: validator,
      onSaved: onSaved,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColor.stroke,
            width: .5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: AppColor.primaryColor,
            width: 1,
          ),
        ),
      ),
    );

    return label == null
        ? textFormField
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(label),
              SizedBox(
                height: 10.0,
              ),
              textFormField
            ],
          );
  }
}
