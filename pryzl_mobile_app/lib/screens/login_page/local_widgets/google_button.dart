import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A Google Authentication Button.
class GoogleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(143),
      height: ScreenUtil().setHeight(40),
      child: FlatButton(
        highlightColor: Color.fromRGBO(207, 67, 50, 0.9),
        splashColor: Color.fromRGBO(207, 67, 50, 0.9),
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: Color.fromRGBO(207, 67, 50, 0.9),
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              0, ScreenUtil().setWidth(7), 0, ScreenUtil().setWidth(7)),
          child: Center(
            child: SvgPicture.asset('assets/images/googleLogo.svg'),
          ),
        ),
      ),
    );
  }
}
