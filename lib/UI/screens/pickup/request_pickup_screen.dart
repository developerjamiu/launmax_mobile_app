import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/ui/widgets/app_dropdown.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_field.dart';

class RequestPickupScreen extends StatefulWidget {
  @override
  _RequestPickupScreenState createState() => _RequestPickupScreenState();
}

class _RequestPickupScreenState extends State<RequestPickupScreen> {
  final formKey = GlobalKey<FormState>();

  static List<String> _vehicle = [
    'Select Vehicle',
    "Bike",
    "Car",
    "Truck",
  ];

  static List<String> _preference = [
    'Select Preference',
    "01",
    "02",
    "03",
  ];

  String _currentVehicle = _vehicle[0];
  String _currentPreference = _preference[0];
  bool _isSwitched = false;

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
          'Request Pick up',
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
                SizedBox(height: 20.0),
                AppTextField(
                  controller: TextEditingController(),
                  keyboardType: TextInputType.text,
                  hintText: 'Search...',
                  suffixIcon: SvgPicture.asset(
                    'assets/images/location_icon.svg',
                    fit: BoxFit.scaleDown,
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        keyboardType: TextInputType.text,
                        label: 'State',
                        hintText: 'Lagos',
                        obscureText: true,
                      ),
                    ),
                    SizedBox(width: 16.0),
                    Expanded(
                      child: AppTextField(
                        controller: TextEditingController(),
                        keyboardType: TextInputType.text,
                        label: 'Locality',
                        hintText: 'Agege',
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                AppTextField(
                  controller: TextEditingController(),
                  label: 'Street Address',
                  keyboardType: TextInputType.text,
                  hintText: 'Enter your street address...',
                  maxLines: 2,
                ),
                SizedBox(height: 20.0),
                AppDropdown(
                  text: 'Preference',
                  items: _preference,
                  value: _currentPreference,
                  onChanged: (value) {
                    _currentPreference = value;
                  },
                ),
                SizedBox(height: 20.0),
                AppDropdown(
                  text: 'Vehicle',
                  items: _vehicle,
                  value: _currentVehicle,
                  onChanged: (value) {
                    _currentVehicle = value;
                  },
                ),
                SizedBox(height: 20.0),
                AppRaisedButton(
                  text: 'Request Pick up',
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
}
