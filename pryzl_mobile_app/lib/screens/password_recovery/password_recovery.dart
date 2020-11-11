import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'local_widgets/id_confirmation_step.dart';
import 'local_widgets/new_password_step.dart';
import 'local_widgets/phone_email_step.dart';

class ResetPasswordForm {
  final PageController pageController = PageController();
  String phoneNumber;
  String email;
}

class PasswordRecovery extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider<ResetPasswordForm>(
      create: (_) => ResetPasswordForm(),
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  Strings.passwordRecoveryTitle,
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w300,
                    fontSize: ScreenUtil().setSp(22),
                  ),
                ),
                Text(
                  Strings.passwordRecoverySubtitle,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w200,
                    fontSize: ScreenUtil().setSp(13),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(75),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      PhoneEmailStep(controller: _pageController),
                      IdConfirmationStep(controller: _pageController),
                      NewPasswordStep(controller: _pageController),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
