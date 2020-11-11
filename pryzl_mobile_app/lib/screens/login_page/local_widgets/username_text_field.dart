import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/types/pryz_input_decoration.dart';

/// A text field to enter a login.
class UsernameField extends StatefulWidget {
  final TextEditingController controller;

  const UsernameField({this.controller});

  @override
  UsernameFieldState createState() => UsernameFieldState();
}

class UsernameFieldState extends State<UsernameField> {
  UsernameFieldState() {
    borderColor = PryzColor.goldAccent;
  }

  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return PryzInputDecoration.embeddedContainer(
      context: context,
      width: ScreenUtil().setWidth(309),
      height: ScreenUtil().setHeight(41),
      child: TextField(
        controller: widget.controller,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSubmitted: (email) {
          FocusScope.of(context).nextFocus();
        },
        onChanged: (text) {
          setState(() {
            if (text == '' || text == null) {
              borderColor = PryzColor.goldAccent;
            } else {
              borderColor = PryzColor.greyAccent;
            }
          });
        },
        decoration: PryzInputDecoration.mainInputDecoration(
          hint: Strings.loginHintTextUsername,
        ),
      ),
    );
  }
}
