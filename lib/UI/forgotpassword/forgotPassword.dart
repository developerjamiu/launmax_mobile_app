import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:launmax_app/UI/signIn/colors.dart';
import 'package:launmax_app/UI/signIn/res.dart';
import 'package:launmax_app/UI/signIn/textfields.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {},
          child: Image.asset('assets/images/Vector.png'),
        ),
        actions: [
          FlatButton(
            color: Colors.white,
            onPressed: () {},
            child: Text(
              'Sign in',
              style: GoogleFonts.sourceSerifPro(
                color: Color(0xff135A59),
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: McGyver.rsDoubleW(context, 4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: McGyver.rsDoubleH(context, 4),
                ),
                Text(
                  'Reset Password',
                  style: GoogleFonts.sourceSerifPro(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: McGyver.textSize(context, 4.5),
                      color: Colors.black),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                
                Text(
                  'Enter your old password connected to your account below to change your password',
                  style: GoogleFonts.sourceSerifPro(
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.normal,
                      fontSize: McGyver.textSize(context, 3),
                      color: Color(0xff999999)),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                Text(
                  'Old Password',
                  style: GoogleFonts.sourceSerifPro(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: McGyver.textSize(context, 3),
                      color: Colors.black),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 2),
                ),
                SigninTextField(
                  text: 'Password',
                  obscure: true,
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                Text(
                  'New Password',
                  style: GoogleFonts.sourceSerifPro(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: McGyver.textSize(context, 3),
                      color: Colors.black),
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                SigninTextField(
                  text: 'Password',
                  obscure: true,
                ),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                    minWidth: width,
                    color: buttonColor,
                    height: McGyver.rsDoubleH(context, 9),
                    child: Text(
                      'Change Password',
                      style: GoogleFonts.sourceSerifPro(
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal,
                          fontSize: McGyver.textSize(context, 3),
                          color: Colors.white),
                    ),
                    onPressed: () {}),
                SizedBox(
                  height: McGyver.rsDoubleH(context, 3),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
