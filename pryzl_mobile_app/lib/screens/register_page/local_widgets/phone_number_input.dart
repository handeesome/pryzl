import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:international_phone_input/international_phone_input.dart';

///A text filed where you can enter the phone number
///
///On the left of the text field you can
///choose the country code from the list
///of the country codes associated with the country flag
class PhoneNumberInput extends StatefulWidget {
  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String phoneNumber;
  String phoneIsoCode;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(41),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      width: ScreenUtil().setWidth(309),
      child: InternationalPhoneInput(
        decoration: InputDecoration(
          errorText: null,
        ),
        onPhoneNumberChange: onPhoneNumberChange,
        initialPhoneNumber: phoneNumber,
        initialSelection: phoneIsoCode,
      ),
    );
  }
}
