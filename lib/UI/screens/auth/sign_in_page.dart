import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:launmax_app/models/auth_repository.dart';
import 'package:launmax_app/models/user.dart';
import 'package:launmax_app/styles.dart';

import 'package:launmax_app/ui/widgets/app_label_button.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_form_field.dart';
import 'package:launmax_app/utils/AppSnackBar.dart';
import 'package:launmax_app/utils/routes.dart';
import 'package:launmax_app/utils/validators.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  final CarouselController carouselController;
  final int index;

  const SignInPage({
    this.carouselController,
    this.index,
  });

  Widget appbarButton() {
    return AppLabelButton(
      text: 'Sign up',
      onPressed: () {
        carouselController.animateToPage(0);
      },
    );
  }

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _repository = AuthRepository();
  final User _newUser = User();
  bool _formChanged = false;
  bool isLoading = false;
  bool hidePassword = true;

  Future<void> submitHandler() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //print(_newUser);
      FocusScope.of(context).unfocus();
      setState(() => isLoading = true);
      String error = await _repository.loginUser(_newUser, context);
      setState(() => isLoading = false);

      if (error == null) {
        // Check if user finished registration
        if (!Provider.of<AppState>(context, listen: false).user.finishedReg) {
          widget.carouselController.animateToPage(1);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.homeScreen,
            (Route<dynamic> route) => false,
          );
        }
      } else {
        Scaffold.of(context).showSnackBar(AppSnackBar.error(error));
      }
    } else {
      //FocusScope.of(context).requestFocus(focusNode);
    }
  }

  void resetPassword() {
    widget.carouselController.animateToPage(3);
  }

  Widget _buildAppleButton() {
    return Column(
      children: [
        AppRaisedButton(
          text: 'Sign in with Apple',
          textColor: Colors.black54,
          prefixIcon: Image.asset(
            'assets/images/apple.png',
            width: 24,
          ),
          onPressed: () {},
          backgroundColor: Colors.white,
        ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Header
        Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  "Sign in",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Welcome Back!",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                AppRaisedButton(
                  text: 'Sign in with Google',
                  textColor: Colors.black54,
                  prefixIcon: Image.asset(
                    'assets/images/googlelogo.png',
                    width: 24,
                  ),
                  onPressed: () {},
                  backgroundColor: Colors.white,
                ),
                SizedBox(height: 20),
                Platform.isIOS ? _buildAppleButton() : SizedBox(),
                Row(
                  children: [
                    Expanded(
                        child: Divider(endIndent: 8.0, color: AppColor.text2)),
                    Text(
                      'OR',
                      style: TextStyle(color: AppColor.text2),
                    ),
                    Expanded(
                        child: Divider(indent: 8.0, color: AppColor.text2)),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  " Fill in your email and password to log in",
                  style: TextStyle(
                      color: AppColor.text2, height: 1.29, fontSize: 17),
                ),
              ],
            )),
        SizedBox(
          height: 20.0,
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
                    label: 'Email Address',
                    hintText: 'example@mail.com',
                    onSaved: (String val) => _newUser.email = val,
                    autovalidate: _formChanged,
                    validator: Validator.isEmail,
                  ),
                  SizedBox(
                    height: 20.0,
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
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.remove_red_eye),
                      onPressed: () {
                        setState(() => hidePassword = !hidePassword);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //  Button
                  AppRaisedButton(
                    text: 'Log in',
                    onPressed: () => submitHandler(),
                  ),
                  SizedBox(height: 10.0),
                  AppLabelButton(
                    text: 'Reset Password',
                    textStyle:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
                    onPressed: resetPassword,
                  ),
                  SizedBox(height: 20.0)
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
