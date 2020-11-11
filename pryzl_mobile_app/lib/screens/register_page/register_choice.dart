import 'package:flutter/material.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/screens/login_page/local_widgets/facebook_button.dart';
import 'package:pryzlmobileapp/screens/login_page/local_widgets/google_button.dart';
import 'package:pryzlmobileapp/screens/login_page/local_widgets/logo.dart';
import 'local_widgets/bottom_bar.dart';

class RegisterChoice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        child: BottomBar(),
      ),
      body: Column(
        children: <Widget>[
          Logo(),
          SizedBox(
            height: ScreenUtil().setHeight(25),
          ),
          LoginForm(),
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FacebookAuth(),
            SizedBox(
              width: ScreenUtil().setWidth(23),
            ),
            GoogleAuth()
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(23),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(143),
              height: 1,
              color: PryzColor.greyAccent,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  ScreenUtil().setWidth(12), 0, ScreenUtil().setWidth(12), 0),
              child: Text(
                Strings.signupOr,
                style: TextStyle(
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenUtil().setSp(17),
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(143),
              height: 1,
              color: PryzColor.greyAccent,
            ),
          ],
        ),
        SizedBox(
          height: ScreenUtil().setHeight(13),
        ),
        GestureDetector(
          onTap: () {
            // Full clean of Navigator's history and navigate to new
            // route:
            Navigator.popUntil(context, ModalRoute.withName('/'));
            Navigator.of(context).pushNamed('RegisterPage');
          },
          child: Text(
            Strings.signupSignInWithPhoneOrEmail,
            style: TextStyle(
              color: Colors.blue,
              fontSize: ScreenUtil().setSp(17),
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
