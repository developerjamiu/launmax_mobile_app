import 'package:flutter/material.dart';

class AppSnackBar {
  static SnackBar error(String _message) {
    return SnackBar(
      content: Text(_message),
      backgroundColor: Colors.red,
    );
  }

  static SnackBar success(String _message) {
    return SnackBar(
      content: Text(_message),
      backgroundColor: Colors.lightGreen,
    );
  }
}
