import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/types/pryz_input_decoration.dart';

/// A text field to enter a password.
///
/// When you tap on the [PasswordField] to enter some text and
/// enter the text, it appears as dots as shown below. You can either
/// allow or restrict this behaviour by clicking the 'eye' button.
class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({this.controller});

  @override
  PasswordFieldState createState() => PasswordFieldState();
}

class PasswordFieldState extends State<PasswordField> {
  PasswordFieldState() {
    borderColor = PryzColor.goldAccent;
  }
  String password;
  static String salt = '';
  Color borderColor;
  bool _obscureText = true;

  void toggle() {
    _obscureText = !_obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return PryzInputDecoration.embeddedContainer(
      context: context,
      width: ScreenUtil().setWidth(309),
      height: ScreenUtil().setHeight(41),
      child: Stack(alignment: Alignment.centerRight, children: <Widget>[
        TextField(
            controller: widget.controller,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            enableSuggestions: false,
            onSubmitted: (password) {
              FocusScope.of(context).unfocus();
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
            obscureText: _obscureText,
            decoration: PryzInputDecoration.mainInputDecoration(
              hint: Strings.loginHintPasswordField,
            )),
        IconButton(
          onPressed: () {
            setState(toggle);
          },
          icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
        ),
      ]),
    );
  }
}
