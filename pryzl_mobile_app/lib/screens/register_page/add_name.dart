import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'add_photo.dart';
import 'local_widgets/bottom_bar.dart';
import 'local_widgets/text_field.dart';

/// A screen where users enters their name or a nickname
///
/// It consists of a column containing [TextfieldWidget],
/// where you can enter the name,
/// the Next button, and the [BottomBar]
///
/// https://www.figma.com/file/Ey7pifYlUBkG83req2aNcs/Draft-pryzl?node-id=64%3A671
class AddName extends StatelessWidget {
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
              Strings.signupAddName,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(22),
                  fontWeight: FontWeight.w300,
                  fontFamily: 'OpenSans'),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(34),
            ),
            Container(
              width: ScreenUtil().setWidth(349),
              child: Text(
                Strings.signupAddNickname,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(17),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'OpenSans'),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(34),
            ),
            TextFieldWidget(
              hint: Strings.signupFullName,
              setWidth: ScreenUtil().setWidth(309),
              setHeight: ScreenUtil().setHeight(41),
              action: TextInputAction.next,
              type: TextInputType.text,
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            PryzButton.primary(
              minWidth: ScreenUtil().setWidth(309),
              height: ScreenUtil().setHeight(41),
              text: Strings.signupNextButton,
              shapeBorder: RoundedRectangleBorder(
                side: BorderSide(color: PryzColor.mainOrange),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(context, photo());
              },
            ),
          ],
        ),
      ),
    );
  }
}

Route photo() {
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryanimation) => AddPhoto(),
      transitionsBuilder: (context, animation, secondaryanimation, child) {
        return FadeTransition(opacity: animation, child: child);
      });
}
