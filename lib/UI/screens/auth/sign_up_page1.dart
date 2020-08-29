import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launmax_app/models/auth_repository.dart';
import 'package:launmax_app/models/user.dart';
import 'package:launmax_app/ui/widgets/app_label_button.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_form_field.dart';
import 'package:launmax_app/utils/AppSnackBar.dart';
import 'package:launmax_app/utils/validators.dart';

class SignUpPage1 extends StatefulWidget {
  final CarouselController carouselController;
  final int index;

  SignUpPage1({this.carouselController, this.index});

  Widget appbarButton() {
    return AppLabelButton(
      text: 'Sign in',
      onPressed: () {
        carouselController.animateToPage(2);
      },
    );
  }

  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _formKey = GlobalKey<FormState>();
  final _repository = AuthRepository();
  final User _newUser = User.fromSignUp1();
  bool _formChanged = false;
  bool isLoading = false;
  bool hidePassword = true;

  Future<void> nextPage() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //print(_newUser);
      FocusScope.of(context).unfocus();
      setState(() => isLoading = true);
      String error = await _repository.createUser(_newUser);
      setState(() => isLoading = false);

      if (error == null) {
        widget.carouselController.animateToPage(widget.index + 1);
      } else {
        Scaffold.of(context).showSnackBar(AppSnackBar.error(error));
      }
    } else {
      //FocusScope.of(context).requestFocus(focusNode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Header
        Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 30.0),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Let's personalize your experience.Kindly complete the form below to get started.",
                  style: TextStyle(color: Color(0xFF8B8B8C), height: 1.29),
                ),
              ],
            )),
        SizedBox(
          height: 30.0,
        ),
        // Body
        Container(
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Builder(
            builder: (_) => Form(
              key: _formKey,
              onChanged: _onFormChange,
              child: Column(
                children: [
                  AppTextFormField(
                    label: 'First Name',
                    onSaved: (String val) => _newUser.fName = val,
                    autovalidate: _formChanged,
                    validator: Validator.isName,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextFormField(
                    label: 'Last Name',
                    onSaved: (String val) => _newUser.lName = val,
                    autovalidate: _formChanged,
                    validator: Validator.isName,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextFormField(
                    label: 'Email Address',
                    hintText: 'example@mail.com',
                    onSaved: (String val) => _newUser.email = val,
                    autovalidate: _formChanged,
                    validator: Validator.isEmail,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextFormField(
                    label: 'Password',
                    readOnly: false,
                    obscureText: hidePassword,
                    onSaved: (String val) => _newUser.password = val,
                    autovalidate: _formChanged,
                    validator: Validator.isPassword,
                    suffixIcon: IconButton(
                      icon: hidePassword
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        setState(() => hidePassword = !hidePassword);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  //  Button
                  AppRaisedButton(
                    text: 'Next',
                    isLoading: isLoading,
                    onPressed: nextPage,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }
}
