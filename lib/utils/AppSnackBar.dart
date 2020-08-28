import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launmax_app/styles.dart';

class AppSnackBar {
  static SnackBar error(String _message) {
    return SnackBar(
      content: Text(_message),
      backgroundColor: Colors.red,
    );
  }
  /*'Hey there!', _message,
  snackPosition: SnackPosition.TOP,
  snackStyle: SnackStyle.FLOATING,
  leftBarIndicatorColor: AppColor.primaryColor,
  backgroundColor: Colors.red,
  borderRadius: 0,
  duration: Duration(seconds: 4),
  icon: Icon(Icons.error)
  // backgroundColor: */

  static SnackBar success(String _message) {
    Get.snackbar('Hey there!', _message,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        leftBarIndicatorColor: AppColor.primaryColor,
        backgroundColor: Colors.lightGreen,
        borderRadius: 0,
        duration: Duration(seconds: 4),
        icon: Icon(Icons.check_circle)
        // backgroundColor: buttonColor
        );
  }
}
