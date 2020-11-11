import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/types/pryz_enums.dart';
import 'package:pryzlmobileapp/types/pryz_password.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'package:pryzlmobileapp/types/pryz_input_decoration.dart';

class NewPasswordStep extends StatefulWidget {
  final PageController controller;

  const NewPasswordStep({this.controller});

  @override
  _NewPasswordStepState createState() => _NewPasswordStepState();
}

class _NewPasswordStepState extends State<NewPasswordStep> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(33), right: ScreenUtil().setWidth(33)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PasswordField(
            formKey: _formKey,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(55),
          ),
          PryzButton.primary(
            minWidth: ScreenUtil().setWidth(309),
            height: ScreenUtil().setHeight(41),
            text: Strings.next,
            onPressed: () {
              FocusScope.of(context).unfocus();
              _formKey.currentState.validate();
            },
          ),
        ],
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final formKey;

  const PasswordField({this.formKey});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final _passwordKey = GlobalKey<FormFieldState>();
  final _confirmPasswordKey = GlobalKey<FormFieldState>();
  TextEditingController passwordController;
  TextEditingController confirmPasswordController;
  PryzPasswordStrength strength;
  Color strengthIndicatorColor;
  Color weakColor;
  Color mediumColor;
  Color strongColor;
  String strengthIndicatorText;

  void updateStrength(PryzPasswordStrength newStrength, Color newWeakColor,
      Color newMediumColor, Color newStrongColor) {
    setState(() {
      strength = newStrength;
      weakColor = newWeakColor;
      mediumColor = newMediumColor;
      strongColor = newStrongColor;
    });
  }

  void updateWeakPassword() {
    updateStrength(
      PryzPasswordStrength.weak,
      Colors.red,
      Colors.transparent,
      Colors.transparent,
    );
  }

  void updateMediumPassword() {
    updateStrength(
      PryzPasswordStrength.medium,
      Colors.red,
      Color.fromRGBO(235, 210, 49, 1),
      Colors.transparent,
    );
  }

  void updateStrongPassword() {
    updateStrength(
      PryzPasswordStrength.strong,
      Colors.red,
      Color.fromRGBO(235, 210, 49, 1),
      Color.fromRGBO(0, 145, 110, 1),
    );
  }

  void updateInvalidPassword() {
    updateStrength(
      null,
      Colors.grey,
      Colors.grey,
      Colors.grey,
    );
  }

  void updateNotMatchingPasswords() {
    if (strength == PryzPasswordStrength.weak) {
      updateStrength(
        strength,
        Colors.grey,
        Colors.transparent,
        Colors.transparent,
      );
    } else if (strength == PryzPasswordStrength.medium) {
      updateStrength(
        strength,
        Colors.grey,
        Colors.grey,
        Colors.transparent,
      );
    } else {
      updateStrength(
        strength,
        Colors.grey,
        Colors.grey,
        Colors.grey,
      );
    }
  }

  void updateEmptyPassword() {
    updateStrength(
        null, Colors.transparent, Colors.transparent, Colors.transparent);
  }

  void refreshPasswordStrength(String password) {
    if (password.isNotEmpty) {
      if (PryzPassword.passwordStrength(password) ==
          PryzPasswordStrength.weak) {
        updateWeakPassword();
      } else if (PryzPassword.passwordStrength(password) ==
          PryzPasswordStrength.medium) {
        updateMediumPassword();
      } else {
        updateStrongPassword();
      }
    } else if (password.isEmpty) {
      updateEmptyPassword();
    } else {
      updateInvalidPassword();
    }
  }

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    updateEmptyPassword();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          PryzInputDecoration.embeddedContainer(
            context: context,
            child: TextFormField(
              key: _passwordKey,
              controller: passwordController,
              decoration: PryzInputDecoration.mainInputDecoration(
                hint: Strings.password,
              ),
              onFieldSubmitted: (password) {
                _passwordKey.currentState.save();
                FocusScope.of(context).nextFocus();
              },
              validator: (password) {
                if (strength == PryzPasswordStrength.weak) {
                  return Strings.passwordRecoveryInvalidWeak;
                } else {
                  return null;
                }
              },
              // ignore: unnecessary_lambdas
              onChanged: (password) {
                refreshPasswordStrength(password);
              },
              onTap: () {
                if (!_passwordKey.currentState.isValid) {
                  _passwordKey.currentState.reset();
                }
              },
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(9)),
          Row(
            children: [
              PasswordStrengthContainer(
                text: strength == PryzPasswordStrength.weak
                    ? Strings.passwordRecoveryWeak
                    : Strings.emptyString,
                color: weakColor,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(9),
              ),
              PasswordStrengthContainer(
                text: strength == PryzPasswordStrength.medium
                    ? Strings.passwordRecoveryMedium
                    : Strings.emptyString,
                color: mediumColor,
              ),
              SizedBox(
                width: ScreenUtil().setWidth(9),
              ),
              PasswordStrengthContainer(
                text: strength == PryzPasswordStrength.strong
                    ? Strings.passwordRecoveryStrong
                    : Strings.emptyString,
                color: strongColor,
              ),
            ],
          ),
          SizedBox(height: ScreenUtil().setHeight(38)),
          PryzInputDecoration.embeddedContainer(
            context: context,
            child: TextFormField(
              key: _confirmPasswordKey,
              controller: confirmPasswordController,
              obscureText: true,
              decoration: PryzInputDecoration.mainInputDecoration(
                hint: Strings.passwordRecoveryConfirmPasswordHint,
              ),
              textInputAction: TextInputAction.done,
              validator: (password) {
                if (password != _passwordKey.currentState.value) {
                  updateNotMatchingPasswords();
                  return Strings.passwordRecoveryInvalidNotMatching;
                } else {
                  refreshPasswordStrength(password);
                  return null;
                }
              },
              onFieldSubmitted: (password) {
                _confirmPasswordKey.currentState.save();
                _confirmPasswordKey.currentState.validate();
                FocusScope.of(context).unfocus();
              },
              onTap: () {
                if (!_confirmPasswordKey.currentState.isValid) {
                  _passwordKey.currentState.reset();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PasswordStrengthContainer extends StatelessWidget {
  final String text;
  final Color color;

  const PasswordStrengthContainer({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 250),
            height: ScreenUtil().setHeight(4),
            width: ScreenUtil().setWidth(97),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: color,
            ),
          ),
          AnimatedDefaultTextStyle(
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: color,
                ),
            duration: Duration(milliseconds: 300),
            child: Text(
              text,
            ),
          ),
        ],
      ),
    );
  }
}
