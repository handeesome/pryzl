import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';

/// A Material Widget containing the link that redirects to Login Page
class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: ScreenUtil().setHeight(96),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: PryzColor.greyAccent,
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Strings.signupAlreadyHaveAnAccount,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(17),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Full clean of Navigator's history and navigate to new route:
                Navigator.popUntil(context, ModalRoute.withName('/'));
                Navigator.of(context).pushNamed('LoginPage');
              },
              child: Text(
                Strings.signIn,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
