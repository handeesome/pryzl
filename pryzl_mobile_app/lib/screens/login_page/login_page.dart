import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/services/firebase_auth_service.dart';
import 'package:pryzlmobileapp/types/pryz_exception.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'package:pryzlmobileapp/widgets/pryz_dialogs.dart';
import 'local_widgets/bottom_bar.dart';
import 'local_widgets/facebook_button.dart';
import 'local_widgets/google_button.dart';
import 'local_widgets/help_text.dart';
import 'local_widgets/logo.dart';
import 'local_widgets/password_field.dart';
import 'local_widgets/username_text_field.dart';

/// A login screen that authenticates users via login/password
/// or google/facebook.
///
/// It consists of the column containing the [Logo] container,
/// [UsernameField], [PasswordField], the Login button, [HelpText],
/// which helps to recover the password in case you forgot it, the Row
/// of [FacebookAuth] and [GoogleAuth] auth buttons, and the [BottomBar].
///
/// https://www.figma.com/file/Ey7pifYlUBkG83req2aNcs/Draft-pryzl?node-id=72%3A4

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<State> _messageDialogKey = GlobalKey<State>();
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    emailController = TextEditingController();
    passwordController = TextEditingController();
    _messageDialogKey = GlobalKey<State>();
  }

  void _toggleProcessing() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> handleLogin(BuildContext context) async {
    var auth = Provider.of<FirebaseAuthService>(context, listen: false);
    var user;

    _toggleProcessing();
    try {
      user = await auth.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (error) {
      switch (error.code) {
        case 'ERROR_INVALID_EMAIL':
          throw PryzException(3001);
        case 'ERROR_WRONG_PASSWORD':
          throw PryzException(3002);
        case 'ERROR_USER_NOT_FOUND':
          throw PryzException(3003);
        case 'ERROR_USER_DISABLED':
          throw PryzException(3004);
        case 'ERROR_TOO_MANY_REQUESTS':
          throw PryzException(3005);
        case 'ERROR_OPERATION_NOT_ALLOWED':
          throw PryzException(3006);
        default:
          // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
          print(error);
          throw PryzException(3007);
      }
    }

    _toggleProcessing();
    if (user == null) {
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      print('Login failed');
      PryzDialog.showMessageDialog(
          context: context,
          key: _messageDialogKey,
          title: Strings.loginFailedDialogTitle,
          message: Strings.loginFailedDialogMessage);
    } else if (!user.isEmailVerified) {
      PryzDialog.showMessageDialog(
        context: context,
        key: _messageDialogKey,
        title: Strings.emailNotConfirmedDialogTitle,
        message: Strings.emailNotConfirmedDialogMessage,
        action: FlatButton(
          child: Text(
            Strings.emailNotConfirmedDialogAction,
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () {
            user.sendEmailVerification();
            Navigator.of(context).pop();
          },
        ),
      );
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
          'LogoutPage', (route) => false,
          arguments: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Logo(),
          SizedBox(
            height: ScreenUtil().setHeight(44),
          ),
          UsernameField(
            controller: emailController,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(16),
          ),
          PasswordField(
            controller: passwordController,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(23),
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(PryzColor.mainOrange),
                  ),
                )
              : PryzButton.primary(
                  shapeBorder: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromRGBO(250, 81, 58, 1)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  text: Strings.logIn,
                  height: ScreenUtil().setHeight(41),
                  minWidth: ScreenUtil().setWidth(309),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    handleLogin(context);
                  },
                ),
          SizedBox(
            height: ScreenUtil().setHeight(16),
          ),
          HelpText(),
          SizedBox(
            height: ScreenUtil().setHeight(20),
          ),
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
        ],
      ),
    );
  }
}
