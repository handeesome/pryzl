import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';

/// A container for the Login and Register buttons.
class LandingPageBottom extends StatelessWidget {
  /// Navigates to the Login Screen if the Login button is clicked
  /// by pushing the LoginPage route to the Navigator.
  void onPressedLogin(context) {
    Navigator.of(context).pushNamed('LoginPage');
  }

  /// Navigates to the Register Screen if the Register button is clicked
  /// by pushing the RegisterPage route to the Navigator.
  void onPressedRegister(context) {
    Navigator.of(context).pushNamed('RegisterChoice');
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: ScreenUtil().setHeight(96),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              PryzButton.secondary(
                minWidth: ScreenUtil().setWidth(125),
                height: ScreenUtil().setHeight(46),
                onPressed: () => onPressedLogin(context),
                text: Strings.logIn.toUpperCase(),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(38),
              ),
              PryzButton.primary(
                minWidth: ScreenUtil().setWidth(125),
                height: ScreenUtil().setHeight(46),
                text: Strings.register.toUpperCase(),
                onPressed: () => onPressedRegister(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
