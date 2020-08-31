import 'package:flutter/material.dart';
import 'package:launmax_app/styles.dart';

import '../../constant.dart';
import 'button_loading_indicator.dart';

enum AppButton {
  PLAIN,
  APPLE,
  GOOGLE,
  OTP,
}

class LoadingIndicator {
  final bool isLoading;
  final AppButton button;

  const LoadingIndicator({this.isLoading = false, this.button});
}

class AppRaisedButton extends StatelessWidget {
  const AppRaisedButton(
      {this.onPressed,
      this.text,
      this.textColor = Colors.white,
      this.backgroundColor,
      this.height,
      this.isLoading = false,
      this.prefixIcon,
      this.elevation});

  final Function onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final Widget prefixIcon;

  /// The [Height] is 50.0 by default
  final double height;
  final bool isLoading;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height ?? 50,
      elevation: elevation,
      minWidth: double.infinity,
      onPressed: onPressed,
      color: backgroundColor ?? AppColor.primaryColor,
      textColor: textColor,
      shape: kRoundedRectangleBorder,
      child: isLoading
          ? ButtonLoadingIndicator(
              color: textColor,
              width: 20,
              height: 20,
            )
          : prefixIcon == null
              ? Text(
                  text,
                  style: TextStyle(fontFamily: 'Montserrat'),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: prefixIcon,
                    ),
                    Text(text)
                  ],
                ),
    );
  }
}
