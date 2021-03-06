import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'enter_password.dart';
import 'local_widgets/bottom_bar.dart';
import 'local_widgets/text_field.dart';

/// A screen where users enter their username.
///
/// It consists of a column containing [TextfieldWidget],
/// where you can enter the username,
/// the Next button, and the [BottomBar]
///
/// https://www.figma.com/file/Ey7pifYlUBkG83req2aNcs/Draft-pryzl?node-id=64%3A671
class EnterUsername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomBar(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              Strings.signupCreateUsername,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(22),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(34),
            ),
            Container(
              width: ScreenUtil().setWidth(309),
              child: Text(
                Strings.signupPickUsername,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(17),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            TextFieldWidget(
              hint: Strings.signupHintTextUsername,
              setWidth: ScreenUtil().setWidth(309),
              setHeight: ScreenUtil().setHeight(41),
              action: TextInputAction.next,
              type: TextInputType.emailAddress,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            PryzButton.primary(
              minWidth: ScreenUtil().setWidth(309),
              height: ScreenUtil().setHeight(41),
              shapeBorder: RoundedRectangleBorder(
                side: BorderSide(color: PryzColor.mainOrange),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              text: Strings.signupNextButton,
              onPressed: () {
                Navigator.of(context).push(password());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Route password() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryanimation) => EnterPassword(),
      transitionsBuilder: (context, animation, secondaryanimation, child) {
        return FadeTransition(opacity: animation, child: child);
      });
}
