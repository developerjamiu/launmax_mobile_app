import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/widgets/app_dropdown.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_field.dart';

class AddPayment extends StatefulWidget {
  @override
  _AddPaymentState createState() => _AddPaymentState();
}

class _AddPaymentState extends State<AddPayment> {
  final formKey = GlobalKey<FormState>();

  var _months = [
    'Exp Month',
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
  ];

  var _years = [
    'Exp Year',
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12",
  ];

  List<String> _cardPaths = [
    'assets/images/paypal_icon.svg',
    'assets/images/visa_icon.svg',
    'assets/images/mastercard_icon.svg',
    'assets/images/diners_icon.svg',
    'assets/images/amex_icon.svg',
  ];

  String _currentMonth = 'Exp Month';
  String _currentYear = 'Exp Year';
  bool _isSwitched = false;
  String _cardSelected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        leading: Center(
          child: FlatButton(
            padding: EdgeInsets.all(0),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.back,
                  size: 16,
                  color: Colors.black,
                ),
                SizedBox(width: 8.0),
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        middle: Text(
          'Add Payment Method',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                Text(
                  'Enter your payment details',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                RichText(
                  text: TextSpan(
                    text: 'By continuing you agree to our ',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(color: Color(0xFF41A393)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                selectCardType(),
                SizedBox(height: 20.0),
                AppTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  label: 'Cardholder Name',
                  hintText: 'Cardholder Name',
                ),
                SizedBox(height: 20.0),
                AppTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  label: 'Card Number',
                  hintText: 'Card Number',
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: AppDropdown(
                        text: 'Exp Month',
                        items: _months,
                        value: _currentMonth,
                        onChanged: (value) {
                          _currentMonth = value;
                        },
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: AppDropdown(
                        text: 'Exp Year',
                        items: _years,
                        value: _currentYear,
                        onChanged: (value) {
                          _currentYear = value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        keyboardType: TextInputType.text,
                        label: 'CVV',
                        hintText: 'CVV',
                        obscureText: true,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 12.0, left: 16.0),
                        child: Text(
                          '3 or 4 digits usually found on the signature strip',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Switch(
                      value: _isSwitched,
                      onChanged: (value) {
                        setState(() {
                          _isSwitched = value;
                        });
                      },
                      activeColor: AppColor.primaryColor,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'SET AS DEFAULT',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                AppRaisedButton(
                  text: 'Add Card',
                  onPressed: () {
                    formKey.currentState.validate();
                  },
                ),
                SizedBox(height: 15.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget selectCardType() {
    return SingleChildScrollView(
      child: Row(
        children: _cardPaths
            .map(
              (String path) => Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _cardSelected = path;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: Stack(
                      children: [
                        Card(
                          elevation: 8,
                          child: AnimatedContainer(
                            padding: EdgeInsets.all(8),
                            duration: Duration(milliseconds: 400),
                            height: _cardSelected == path ? 70 : 50,
                            width: MediaQuery.of(context).size.width / 4,
                            child: SvgPicture.asset(
                              path,
                            ),
                          ),
                        ),
                        _cardSelected == path
                            ? Positioned(
                                bottom: -2,
                                right: -3,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 13,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
