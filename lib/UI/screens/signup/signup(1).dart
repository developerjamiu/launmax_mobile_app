import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:launmax_app/widgets/form_fields.dart';

class Signup1 extends StatefulWidget {
  final CarouselController carouselController;
  final int index;

  Signup1({this.carouselController, this.index});

  @override
  _Signup1State createState() => _Signup1State();
}

class _Signup1State extends State<Signup1> {
  final _genderController = TextEditingController();
  String _selectedGender = 'Select Gender';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ListView(
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
                      "Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 30.0),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Let's personalize your experience.Kindly complete the form below to get started.",
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
                          text: 'First Name',
                        ),
                        SizedBox(
                          height: 30.0,
                        ),

                        FormFields(
                          text: 'Last Name',
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FormFields(
                          text: 'Mobile Phone',
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        FormFields(
                          onTap: () {
                            genderSelection();
                          },
                          text: 'Gender',
                          controller: _genderController,
                          readOnly: true,
                          hintText: _selectedGender,
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),

                        SizedBox(
                          height: 30.0,
                        ),

                        //  Button
                        ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: MaterialButton(
                            onPressed: () => widget.carouselController
                                .animateToPage(widget.index + 1),
                            child: Text(
                              'Next',
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
