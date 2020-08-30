import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class Phone {
  static const field_number = 'number';
  static const field_dialCode = 'dialCode';
  static const field_isoCode = 'isoCode';

  String number;
  String dialCode;
  String isoCode;

  Phone({
    this.number,
    this.dialCode,
    this.isoCode,
  });

  factory Phone.fromPackage(PhoneNumber phoneNumber) => Phone(
      number: phoneNumber.phoneNumber,
      dialCode: phoneNumber.dialCode,
      isoCode: phoneNumber.isoCode);

  Map<String, dynamic> toJson() {
    return {
      field_number: number,
      field_dialCode: dialCode,
      field_isoCode: isoCode,
    };
  }
}
