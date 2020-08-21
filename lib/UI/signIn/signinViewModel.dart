import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:launmax_app/UI/signIn/snackbarservice.dart';

enum ButtonState { Idle, Pressed }

class SigninViewModel with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  ButtonState _buttonState = ButtonState.Idle;

  ButtonState get buttonState => _buttonState;

  void setState(ButtonState buttonState) {
    _buttonState = buttonState;
    notifyListeners();
  }

  Future<String> signIn(
    String email,
    String password,
  ) async {
    try {
      setState(ButtonState.Pressed);
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      setState(ButtonState.Idle);
      assert(user != null);
      assert(await user.user.getIdToken() != null);
      SnackBarService.instance.showSnackBarSuccess('Welcome back!');
      return user.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        setState(ButtonState.Idle);
        SnackBarService.instance
            .showSnackBarError('No user found for that email');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        setState(ButtonState.Idle);
        SnackBarService.instance
            .showSnackBarError('Wrong password provided for that user');
        return null;
      }
    }
  }

  Future sendPasswordResetEmail(String email) async {
    SnackBarService.instance.showSnackBarSuccess(
        'A link to reset your password has been sent to ${email}');
    return auth.sendPasswordResetEmail(email: email.trim());
  }
}
