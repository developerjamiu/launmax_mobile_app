import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_form_field.dart';

class SignUpPage1 extends StatefulWidget {
  final CarouselController carouselController;
  final int index;

  SignUpPage1({this.carouselController, this.index});

  @override
  _SignUpPage1State createState() => _SignUpPage1State();
}

class _SignUpPage1State extends State<SignUpPage1> {
  final _formKey = GlobalKey<FormState>();
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
                    child: Column(
                      children: [
                        AppTextFormField(
                          label: 'First Name',
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        AppTextFormField(
                          label: 'Last Name',
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        AppTextFormField(
                          label: 'Email Address',
                          hintText: 'example@mail.com',
                          readOnly: false,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        AppTextFormField(
                          label: 'Password',
                          readOnly: false,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        //  Button
                        AppRaisedButton(
                          text: 'Next',
                          onPressed: () => widget.carouselController
                              .animateToPage(widget.index + 1),
                        )
                      ],
                    ),
                  )),
        )
      ],
    );
  }
}
