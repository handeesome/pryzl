import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A Facebook Authentication Button.
class FacebookAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(143),
      height: ScreenUtil().setHeight(40),
      child: FlatButton(
        highlightColor: Color.fromRGBO(60, 102, 196, 0.8),
        splashColor: Color.fromRGBO(60, 102, 196, 0.8),
        color: Color.fromRGBO(60, 102, 196, 0.8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              0, ScreenUtil().setWidth(7), 0, ScreenUtil().setWidth(7)),
          child: Center(
            child: SvgPicture.asset('assets/images/facebookLogo.svg'),
          ),
        ),
      ),
    );
  }
}
