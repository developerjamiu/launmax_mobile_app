
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launmax_app/UI/signIn/res.dart';
import 'package:launmax_app/UI/signIn/signinViewModel.dart';

class SigninTextField extends StatefulWidget {
  final String text;
  final Widget icon;
  final bool obscure;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final SigninViewModel viewModel;
  final String Function(String) validator;
  final TextInputType keyboardType;

  const SigninTextField(
      {Key key,
      this.text,
      this.icon,
      this.controller,
      this.onChanged,
      this.obscure,
      this.viewModel,
      this.validator,
      this.keyboardType})
      : super(key: key);

  @override
  _SigninTextFieldState createState() => _SigninTextFieldState();
}

class _SigninTextFieldState extends State<SigninTextField> {
  bool visible = false;
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      obscureText: widget.text == 'Password' ? visible ? false : true : false,
      decoration: InputDecoration(
        border: InputBorder.none,
        
        filled: false,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
          borderRadius: BorderRadius.circular(9),
        ),
        labelText: widget.text,
        suffixIcon: widget.text == 'Password'
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    visible = !visible;
                  });
                },
                child: visible
                    ? Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                      ),
              )
            : SizedBox(),
        labelStyle: GoogleFonts.dmSans(
          fontSize: McGyver.textSize(context, 2.2),
          color: Color(0xff332f2f),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}