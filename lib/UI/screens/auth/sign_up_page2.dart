import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:launmax_app/models/user.dart';
import 'package:launmax_app/ui/widgets/app_label_button.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_form_field.dart';

import '../../../styles.dart';

class SignUpPage2 extends StatefulWidget {
  final CarouselController carouselController;
  final int index;

  const SignUpPage2({
    this.carouselController,
    this.index,
  });

  Widget appbarButton() {
    return AppLabelButton(
      text: 'Sign in',
      onPressed: () {
        carouselController.animateToPage(2);
      },
    );
  }

  @override
  _SignUpPage2State createState() => _SignUpPage2State();
}

class _SignUpPage2State extends State<SignUpPage2> {
  final _formKey = GlobalKey<FormState>();

  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    //
    Widget _buildGenderDropDown() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gender'),
          SizedBox(height: 10.0),
          DropdownButtonFormField(
            hint: Text("Select Gender"),
            value: selectedGender,
            decoration: InputDecoration(
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
            items: [
              DropdownMenuItem(
                value: Gender.FEMALE,
                child: Text(
                  'Female',
                ),
              ),
              DropdownMenuItem(
                value: Gender.MALE,
                child: Text(
                  'Male',
                ),
              ),
              DropdownMenuItem(
                value: Gender.NOTSAY,
                child: Text(
                  'I rather not say',
                ),
              ),
            ],
            validator: (value) {
              if (value == null) {
                return 'Select a Gender';
              }
              return null;
            },
            onChanged: (value) {
              print(value);
              setState(() {
                selectedGender = value;
              });
            },
          ),
        ],
      );
    }

    return ListView(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set up Account",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Hi John",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Fill in your contact and residential details to finish setting up your account.",
                  style: TextStyle(color: Color(0xFF8B8B8C)),
                ),
              ],
            )),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Builder(
            builder: (_) => Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    label: 'Address',
                    hintText: "Enter your home address...",
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextFormField(
                    label: 'City',
                    readOnly: false,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AppTextFormField(
                    label: 'Mobile Phone',
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildGenderDropDown(),
                  SizedBox(
                    height: 30.0,
                  ),
                  //  Button
                  AppRaisedButton(
                    text: 'Create Account',
                    onPressed: () => widget.carouselController.previousPage(),
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
