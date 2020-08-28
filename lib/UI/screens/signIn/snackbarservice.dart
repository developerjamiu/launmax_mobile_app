import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:launmax_app/styles.dart';

class SnackBarService {
  BuildContext _buildContext;

  static SnackBarService instance = SnackBarService();

  SnackBarService();

  set buildContext(BuildContext _context) {
    _buildContext = _context;
  }

  void showSnackBarError(String _message) {
    Get.snackbar('Hey there!', _message,
        snackPosition: SnackPosition.TOP,
        snackStyle: SnackStyle.FLOATING,
        leftBarIndicatorColor: AppColor.primaryColor,
        backgroundColor: Colors.red,
        borderRadius: 0,
        duration: Duration(seconds: 4),
        icon: Icon(Icons.error)
        // backgroundColor: buttonColor
        );
  }

  void showSnackBarSuccess(String _message) {
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
