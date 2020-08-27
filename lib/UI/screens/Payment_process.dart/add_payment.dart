import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/UI/widgets/card_selector_builder.dart';
import 'package:launmax_app/widgets/form_fields.dart';

import '../../../styles.dart';

class AddPayment extends StatefulWidget {
  @override
  _AddPayment createState() => _AddPayment();
}

class _AddPayment extends State<AddPayment> {
  final _genderController = TextEditingController();
  String _selectedGender = 'Select Gender';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Payment Method',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        children: [
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
                        "Enter your payment details",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15.0),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "By Continuing you agree to our Terms ",
                      style: TextStyle(color: Color(0xFF8B8B8C)),
                    ),
                  ),
                ],
              )),
          CardSelectionBuilder(),
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
                            text: 'Cardholder name',
                          ),
                          SizedBox(
                            height: 30.0,
                          ),

                          FormFields(
                            text: 'Card Number',
                            obscureText: true,
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text('Exp Month')),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF8B8B8C),
                                              width: .2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF8B8B8C),
                                              width: .2),
                                        ),
                                      ),
                                      elevation: 1,
                                      items: <int>[
                                        1,
                                        2,
                                        3,
                                        4,
                                        5,
                                        6,
                                        7,
                                        8,
                                        9,
                                        10,
                                        11,
                                        12
                                      ].map((int val) {
                                        return new DropdownMenuItem<int>(
                                          child: new Text('$val'),
                                          value: val,
                                        );
                                      }).toList(),
                                      onChanged: (value) => print('dfdfd'),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.topLeft,
                                        child: Text('Exp Year')),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    DropdownButtonFormField<int>(
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF8B8B8C),
                                              width: .2),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF8B8B8C),
                                              width: .2),
                                        ),
                                      ),
                                      elevation: 1,
                                      items: <int>[
                                        2020,
                                        2021,
                                        2022,
                                        2023,
                                        2024,
                                        2025,
                                        2026,
                                        2027,
                                        2027,
                                        2028,
                                        2029,
                                        2030,
                                        2031
                                      ].map((int val) {
                                        return new DropdownMenuItem<int>(
                                          value: val,
                                          child: new Text('$val'),
                                        );
                                      }).toList(),
                                      onChanged: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 30.0,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: FormFields(
                                  text: 'CVV',
                                ),
                              ),
                              Text(
                                  '3 or 4 digits usually found\n on the signature strip'),
                            ],
                          ),

                          SizedBox(
                            height: 30.0,
                          ),

                          Material(
                            elevation: 18.0,
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAlias,
                            child: Switch(
                              activeTrackColor: Colors.white,
                              value: true,
                              onChanged: (value) {
                                print('null');
                              },
                              activeColor: AppColor.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),

                          //  Button
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: MaterialButton(
                              onPressed: () {},
                              child: Text(
                                'Add Card',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
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
      ),
    );
  }

  genderSelection() {
    List<String> gender = ['male', 'female', 'i rather not say'];
    List<IconData> genderIcon = [
      FontAwesomeIcons.male,
      FontAwesomeIcons.female,
      FontAwesomeIcons.userLock
    ];
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text("Select your gender"),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListView.builder(
                    itemCount: gender.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          setState(() {
                            _genderController..text = gender[index];
                            _selectedGender = gender[index];
                          });
                          print(_genderController.text);
                          print(_selectedGender);
                          Navigator.pop(context);
                        },
                        title: Text(gender[index]),
                        leading: Icon(genderIcon[index]),
                      );
                    }),
              ),
            ));
  }
}
