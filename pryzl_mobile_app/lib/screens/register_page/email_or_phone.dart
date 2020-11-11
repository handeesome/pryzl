import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'enter_username.dart';
import 'local_widgets/bottom_bar.dart';
import 'local_widgets/phone_number_input.dart';
import 'local_widgets/text_field.dart';

/// A screen where the users inserts their phone number or email.
///
/// It consists of a column containing 2 tabs. The first one contains
/// the [PhoneNumberInput] widget and the Next button. The second one
/// contains the [TextFieldWidget] widget and the Next button.
/// The bottom contains the [BottomBar] widget.
///
/// https://www.figma.com/file/Ey7pifYlUBkG83req2aNcs/Draft-pryzl?node-id=64%3A671
class EmailOrPhone extends StatelessWidget {
  Widget buildNextButton(BuildContext context) {
    return PryzButton.primary(
      text: Strings.signupNextButton,
      minWidth: ScreenUtil().setWidth(309),
      height: ScreenUtil().setHeight(41),
      shapeBorder: RoundedRectangleBorder(
        side: BorderSide(color: PryzColor.mainOrange),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(username());
      },
    );
  }

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
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: <Widget>[
            Text(Strings.signupEnterPhoneOrEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(22),
                )),
            SizedBox(
              height: ScreenUtil().setHeight(39),
            ),
            TabBar(
                indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.fromLTRB(ScreenUtil().setWidth(33), 0,
                      ScreenUtil().setWidth(33), 0),
                  borderSide: BorderSide(color: PryzColor.greyAccent),
                ),
                labelStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(17),
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(17),
                ),
                tabs: [
                  Tab(text: Strings.signupPhone),
                  Tab(text: Strings.signupEmail),
                ]),
            Expanded(
              child: TabBarView(
                children: [
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(39),
                      ),
                      PhoneNumberInput(),
                      SizedBox(
                        height: ScreenUtil().setHeight(32),
                      ),
                      buildNextButton(context),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      SizedBox(
                        height: ScreenUtil().setHeight(39),
                      ),
                      TextFieldWidget(
                        hint: Strings.signupEmail,
                        setWidth: ScreenUtil().setWidth(309),
                        setHeight: ScreenUtil().setHeight(41),
                        action: TextInputAction.next,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(32),
                      ),
                      buildNextButton(context),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route username() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryanimation) => EnterUsername(),
      transitionsBuilder: (context, animation, secondaryanimation, child) {
        return FadeTransition(opacity: animation, child: child);
      });
}
