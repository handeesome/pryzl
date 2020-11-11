import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';

/// A text field to enter a personal details.
class TextFieldWidget extends StatefulWidget {
  final double setWidth;
  final double setHeight;
  final String hint;
  final bool hideText;
  final TextInputAction action;
  final TextInputType type;
  final Function onSubmitted;

  const TextFieldWidget(
      {this.setWidth,
      this.setHeight,
      this.hint,
      this.hideText,
      this.action,
      this.type,
      this.onSubmitted});
  @override
  TextFieldWidgetState createState() => TextFieldWidgetState();
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  TextFieldWidgetState() {
    borderColor = PryzColor.goldAccent;
  }

  Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
            colors: [
              Color.fromRGBO(151, 162, 171, 0.35),
              Color.fromRGBO(151, 162, 171, 0.1)
            ],
            begin: FractionalOffset(0, 0),
            end: FractionalOffset(0, 1),
            stops: [0, 0.1]),
      ),
      //color: Color.fromRGBO(151, 162, 171, 0.1),
      width: widget.setWidth,
      height: widget.setHeight,
      child: TextField(
        obscureText: widget.hideText ?? false,
        enableSuggestions: false,
        textInputAction: widget.action,
        keyboardType: widget.type,
        onSubmitted: widget.onSubmitted,
        onChanged: (text) {
          setState(() {
            if (text == '' || text == null) {
              borderColor = PryzColor.goldAccent;
            } else {
              borderColor = PryzColor.greyAccent;
            }
          });
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(13),
              ScreenUtil().setWidth(10), 0, ScreenUtil().setWidth(10)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: borderColor),
          ),
          hintText: widget.hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: PryzColor.greyAccent,
            ),
          ),
        ),
      ),
    );
  }
}
