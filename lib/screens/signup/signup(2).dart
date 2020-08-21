import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:launmax_app/widgets/form_fields.dart';

class Signup2 extends StatefulWidget {
  final CarouselController carouselController;
  final int index;

  const Signup2({
    this.carouselController,
    this.index,
  });

  @override
  _Signup2State createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 30.0,
        ),
        Container(
            padding: EdgeInsets.only(left: 18.0, right: 18.0),
            child: Column(
              children: [
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
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Hi John",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 18.0),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Fill in your residential address and city to create your account.",
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
                        FormFields(
                          text: 'Address',
                          hintText: "Enter your home address...",
                          readOnly: false,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        FormFields(
                          text: 'City',
                          readOnly: false,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FormFields(
                          text: 'Email Address',
                          hintText: 'example@mail.com',
                          readOnly: false,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FormFields(
                          text: 'Password',
                          readOnly: false,
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        //  Button
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(
                            onPressed: () => widget.carouselController
                                .animateToPage(widget.index - 1),
                            child: Text(
                              'Create Account',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            color: Color(0xFF135A59),
                            minWidth: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.06,
                          ),
                        )
                      ],
                    ),
                  )),
        )
      ],
    );
  }
}
