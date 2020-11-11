import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';

/// A screen where users can upload their profile photo.
///
/// It consists of a column containing a picture
/// in the middle and bottom bar containing 2 buttons,
/// the Add Photo button and the Skip button which skips this process.
///
/// https://www.figma.com/file/Ey7pifYlUBkG83req2aNcs/Draft-pryzl?node-id=64%3A671
class AddPhoto extends StatelessWidget {
  Widget buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: ScreenUtil().setHeight(152),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: PryzColor.greyAccent,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PryzButton.primary(
              minWidth: ScreenUtil().setWidth(309),
              height: ScreenUtil().setHeight(41),
              shapeBorder: RoundedRectangleBorder(
                side: BorderSide(color: PryzColor.mainOrange),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              text: Strings.signupAddPhotoButton,
              onPressed: () {},
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            PryzButton.secondary(
              minWidth: ScreenUtil().setWidth(309),
              height: ScreenUtil().setHeight(41),
              text: Strings.signupSkipButton,
              color: Theme.of(context).brightness == Brightness.dark
                  ? PryzColor.darkBackground
                  : PryzColor.lightBackground,
              shapeBorder: RoundedRectangleBorder(
                side: BorderSide(color: PryzColor.mainOrange),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('HomePage', (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: buildBottomAppBar(context),
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
            Container(
              width: ScreenUtil().setWidth(309),
              child: Text(
                Strings.signupAddPhoto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(22),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(32),
            ),
            Container(
              width: ScreenUtil().setWidth(342),
              child: Text(
                Strings.signupAddProfilePhoto,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w300,
                  fontSize: ScreenUtil().setSp(17),
                ),
              ),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(96),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment(0, 0),
                  child:
                      Center(child: Image.asset('assets/images/addPhoto.png')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
