import 'package:get/utils.dart';
import 'package:launmax_app/models/user.dart';

class Validator {
  static String isName(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isAlphabetOnly(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String isEmail(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String isPassword(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterOrEqual(value, 6)) {
      return 'Password must be 6 characters long';
    }
    return null;
  }

  static String isAddress(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else if (!GetUtils.isLengthGreaterThan(value, 4)) {
      return 'Please enter a valid Address';
    }
    return null;
  }

  static String isGender(Gender value) {
    if (value == null) {
      return 'Please select a valid Gender';
    }
    return null;
  }
}
