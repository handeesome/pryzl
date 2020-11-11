import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';

import '../../password_recovery/password_recovery.dart';

/// A container helping to sign in in case the credentials are forgotten.
class HelpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(309),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: ScreenUtil().setSp(14),
                ),
            text: Strings.loginForgotDetails,
            children: [
              TextSpan(
                text: Strings.loginGetHelpSignIn,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(14),
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).push(MaterialPageRoute(
                      fullscreenDialog: true,
                      maintainState: false,
                      builder: (context) => PasswordRecovery(),
                    ));
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
