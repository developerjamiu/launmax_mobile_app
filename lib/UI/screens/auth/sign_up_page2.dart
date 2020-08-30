import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:launmax_app/models/address.dart';
import 'package:launmax_app/models/app_state.dart';
import 'package:launmax_app/models/auth_repository.dart';
import 'package:launmax_app/models/phone.dart';
import 'package:launmax_app/ui/widgets/phone_form_field.dart';
import 'package:launmax_app/models/user.dart';
import 'package:launmax_app/ui/widgets/app_label_button.dart';
import 'package:launmax_app/ui/widgets/app_raised_button.dart';
import 'package:launmax_app/ui/widgets/app_text_form_field.dart';
import 'package:launmax_app/utils/AppSnackBar.dart';
import 'package:launmax_app/utils/validators.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

const kGoogleApiKey = "AIzaSyA915iZ2FyNAYmv-xvwPa1FTMIPlSxKVyc";

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class SignUpPage2 extends StatefulWidget {
  final CarouselController carouselController;

  const SignUpPage2({
    this.carouselController,
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
  AuthRepository _repository;
  User _completeUser;
  bool _formChanged = false;
  bool isLoading = false;
  //bool phoneNumber

  Gender selectedGender;
  PhoneNumber phone;
  Address address;

  TextEditingController _addressController;

  void initState() {
    _repository = AuthRepository();
    _addressController = TextEditingController();
    _completeUser =
        User.fromSignUp2(Provider.of<AppState>(context, listen: false).user);
    super.initState();
  }

  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  Future<void> submitHandler() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //print(_newUser);
      FocusScope.of(context).unfocus();
      setState(() => isLoading = true);
      String error = await _repository.setUpUser(_completeUser, context);
      setState(() => isLoading = false);

      if (error == null) {
        widget.carouselController.nextPage();
      } else {
        Scaffold.of(context).showSnackBar(AppSnackBar.error(error));
      }
    } else {
      //FocusScope.of(context).requestFocus(focusNode);
    }
  }

  showAutocompleteDialog() async {
    try {
      Prediction p = await PlacesAutocomplete.show(
          context: context,
          apiKey: kGoogleApiKey,
          overlayBorderRadius: BorderRadius.circular(5),
          mode: Mode.overlay, // Mode.fullscreen
          language: "en",
          components: [Component(Component.country, "ng")],
          onError: (PlacesAutocompleteResponse response) {
            print("Your Error: $response");
          });
      displayPrediction(p);
    } catch (e) {
      print(e);
    }
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      _addressController.text = p.description;
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final long = detail.result.geometry.location.lng;

      List<AddressComponent> addressComponents =
          detail.result.addressComponents;
      String state = addressComponents[addressComponents.length - 2].longName;
      String country = addressComponents[addressComponents.length - 1].longName;

      address = Address(
        description: p.description,
        state: state,
        country: country,
        geoPoint: GeoPoint(lat, long),
      );

      print(address.toJson().toString());
    } else {
      print('ererer');
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    Widget _buildGenderDropDown() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Gender'),
          SizedBox(
            height: 10.0,
          ),
          DropdownButtonFormField(
            hint: Text("Select Gender"),
            value: selectedGender,
            autovalidate: _formChanged,
            validator: Validator.isGender,
            onSaved: (gender) => _completeUser.gender = gender,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
            onChanged: (value) {
              setState(() {
                selectedGender = value;
              });
            },
          ),
        ],
      );
    }

    Widget _buildPhoneTextField() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Mobile phone number"),
            SizedBox(
              height: 10.0,
            ),
            PhoneFormField(
                autovalidate: _formChanged,
                initialValue: PhoneNumber(isoCode: "NG"),
                onChanged: (value) {
                  phone = value;
                },
                onSaved: () {
                  phone != null
                      ? _completeUser.phone = Phone.fromPackage(phone)
                      : Scaffold.of(context).showSnackBar(
                          AppSnackBar.error(
                              "Couldn't get Phone number kindly add it later"),
                        );
                }),
          ],
        );

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
                "Hi ${Provider.of<AppState>(context).user.fName}",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Fill in your residential and other details to finish setting up your account.",
                style: TextStyle(color: Color(0xFF8B8B8C)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
          child: Builder(
            builder: (_) => Form(
              key: _formKey,
              onChanged: _onFormChange,
              child: Column(
                children: [
                  AppTextFormField(
                    label: 'Address',
                    controller: _addressController,
                    hintText: "Enter your home address...",
                    readOnly: true,
                    onSaved: (_) {
                      _completeUser.address = address;
                    },
                    autovalidate: _formChanged,
                    validator: Validator.isAddress,
                    onTap: showAutocompleteDialog,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildGenderDropDown(),
                  SizedBox(
                    height: 30.0,
                  ),
                  _buildPhoneTextField(),
                  SizedBox(
                    height: 30.0,
                  ),
                  //  Button
                  AppRaisedButton(
                    text: 'Create Account',
                    isLoading: isLoading,
                    onPressed: submitHandler,
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

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }
}
