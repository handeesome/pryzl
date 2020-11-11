import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';

/// A class that defines a [build()] method, which creates a container with the
/// background image containing the Pryzl logo and the title.
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(317),
      width: ScreenUtil().setWidth(375),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/group1.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Color.fromRGBO(46, 36, 51, 0.55),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo2.png',
              fit: BoxFit.fill,
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(50),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(21),
            ),
            Text(
              Strings.appName.toUpperCase(),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w300,
                fontSize: ScreenUtil().setSp(36),
                color: PryzColor.lightBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
