import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    Key key,
    this.autovalidate,
    this.initialValue,
    this.onSaved,
    this.onChanged,
  }) : super(key: key);

  final bool autovalidate;
  final PhoneNumber initialValue;
  final VoidCallback onSaved;
  final ValueChanged<PhoneNumber> onChanged;

  @override
  Widget build(BuildContext context) {
    // Preserved the value internally due to a possible bug
    return FormField<PhoneNumber>(
      key: key,
      initialValue: initialValue,
      onSaved: (_) => onSaved(),
      autovalidate: autovalidate,
      builder: (formState) {
        void onChangedHandler(PhoneNumber value) {
          if (onChanged != null) {
            onChanged(value);
          }
        }

        return InternationalPhoneNumberInput(
          selectorType: PhoneInputSelectorType.DIALOG,
          initialValue: formState.value,
          autoValidate: autovalidate,
          locale: 'en',
          //     onInputValidated: (val),
          textStyle: Theme.of(context).textTheme.bodyText2,
          selectorTextStyle: Theme.of(context).textTheme.bodyText2,
          onInputChanged: onChangedHandler,
          inputDecoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          searchBoxDecoration: InputDecoration(
            suffixIcon: Icon(Icons.search),
            labelText: 'Search by Country Name',
          ),
        );
      },
    );
  }
}
