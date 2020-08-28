import 'package:firebase_auth/firebase_auth.dart';

enum Gender { FEMALE, MALE, NOTSAY }
enum SignUpState { ONE, TWO }

class User {
  String fName;
  String lName;
  String email;
  String password;
  SignUpState signUpState;

  User({this.fName, this.lName, this.email, this.password, this.signUpState});

  User.fromSignUp1() {
    this.signUpState = SignUpState.ONE;
  }

  @override
  String toString() {
    return '$fName : $lName : $email : $password : $signUpState';
  }
}
