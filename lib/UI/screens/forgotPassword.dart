import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:launmax_app/UI/screens/signIn/res.dart';
import 'package:launmax_app/UI/screens/signIn/signinViewModel.dart';
import 'package:launmax_app/UI/screens/signIn/textfields.dart';
import 'package:launmax_app/UI/screens/signIn/validators.dart';
import 'package:launmax_app/styles.dart';
import 'package:launmax_app/utils/validators.dart';
import 'package:provider/provider.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SigninViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 4)),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 4),
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: McGyver.textSize(context, 4.5),
                      fontFamily: 'SFProDisplay-Medium-1',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff151522),
                    ),
                  ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 3),
                  ),
                  Text(
                    'Enter the email address associated with your account. A link to reset your password would be sent.',
                    style: TextStyle(
                      fontSize: McGyver.textSize(context, 3),
                      fontFamily: 'SFProText-Regular',
                      fontWeight: FontWeight.normal,
                      color: Color(0xff999999),
                    ),
                  ),
                  // Text(
                  //   'Enter your old password connected to your account below to change your password',
                  //   style: TextStyle(
                  //     fontSize: McGyver.textSize(context, 3),
                  //     fontFamily: 'SFProText-Regular',
                  //     fontWeight: FontWeight.normal,
                  //     color: Color(0xff999999),
                  //   ),
                  // ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 3),
                  ),
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: McGyver.textSize(context, 3),
                      fontFamily: 'SFProText-Regular',
                      fontWeight: FontWeight.w600,
                      color: Color(0xff151522),
                    ),
                  ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 2),
                  ),
                  SigninTextField(
                    controller: emailController,
                    validator: Validator.isEmail,
                    keyboardType: TextInputType.emailAddress,
                    text: 'Email',
                    obscure: false,
                  ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 3),
                  ),
                  // Text(
                  //   'Old Password',
                  //   style: TextStyle(
                  //     fontSize: McGyver.textSize(context, 3),
                  //     fontFamily: 'SFProText-Regular',
                  //     fontWeight: FontWeight.w600,
                  //     color: Color(0xff151522),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: McGyver.rsDoubleH(context, 2),
                  // ),
                  // SigninTextField(
                  //   text: 'Password',
                  //   obscure: true,
                  // ),
                  // SizedBox(
                  //   height: McGyver.rsDoubleH(context, 3),
                  // ),
                  // Text(
                  //   'New Password',
                  //   style: TextStyle(
                  //     fontSize: McGyver.textSize(context, 3),
                  //     fontFamily: 'SFProText-Regular',
                  //     fontWeight: FontWeight.w600,
                  //     color: Color(0xff151522),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: McGyver.rsDoubleH(context, 3),
                  // ),
                  // SigninTextField(
                  //   text: 'Password',
                  //   obscure: true,
                  // ),
                  // SizedBox(
                  //   height: McGyver.rsDoubleH(context, 3),
                  // ),
                  viewModel.buttonState == ButtonState.Idle
                      ? MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          minWidth: width,
                          color: AppColor.primaryColor,
                          height: McGyver.rsDoubleH(context, 9),
                          child: Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: McGyver.textSize(context, 3),
                              fontFamily: 'SFProText-Regular',
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {
                            final form = formKey.currentState;
                            form.save();
                            if (form.validate()) {
                              try {
                                viewModel.sendPasswordResetEmail(
                                  emailController.text,
                                );
                              } catch (e) {
                                print(e);
                              }
                            }
                          })
                      : SpinKitThreeBounce(
                          color: AppColor.primaryColor,
                        ),
                  SizedBox(
                    height: McGyver.rsDoubleH(context, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
