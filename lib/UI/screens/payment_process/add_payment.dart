import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/widgets/form_fields.dart';

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
                            fontWeight: FontWeight.w600, fontSize: 30.0),
                      )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "By Continuing you agree to our Terms ",
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
                            text: 'Cardholder name',
                          ),
                          SizedBox(
                            height: 30.0,
                          ),

                          FormFields(
                            text: 'Card Number',
                            obscureText: true,
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            children: [
                              DropdownButton(items: null, onChanged: null),
                              DropdownButton(items: null, onChanged: null)
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            child: Row(
                              children: [
                                FormFields(
                                  text: 'CSV',
                                ),
                                Text(
                                    'sdnndnfdjfndskjfnsdfbjdfjsdbfsdbfjdsbfsddknnsdjjnf'),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 30.0,
                          ),

                          Switch(
                            value: false,
                            onChanged: null,
                            activeColor: Colors.red,
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
