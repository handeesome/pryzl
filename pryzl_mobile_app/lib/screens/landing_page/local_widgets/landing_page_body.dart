import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';

/// A class that defines a [build()] method, which creates a container with the
/// background image containing the Pryzl logo, title and the subtitle with the
/// fading effect.
///
/// To create the text fade effect, we use an [AnimatedSwitcher]. Text fades in
/// after the page is rendered.
class LandingPageBody extends StatefulWidget {
  @override
  _LandingPageBodyState createState() => _LandingPageBodyState();
}

class _LandingPageBodyState extends State<LandingPageBody> {
  Widget animatedChild;
  Widget subtitle = Text(
    Strings.landingSubTitle,
    key: ValueKey(1),
    textAlign: TextAlign.center,
    softWrap: true,
    style: TextStyle(
      fontFamily: 'OpenSans',
      fontWeight: FontWeight.w300,
      fontSize: ScreenUtil().setSp(24),
      color: PryzColor.lightBackground,
    ),
  );

  Widget subtitleEmpty = Text(
    '\n ',
    key: ValueKey(2),
    style: TextStyle(
      fontSize: ScreenUtil().setSp(28),
      fontWeight: FontWeight.w300,
    ),
  );

  void hideSubtitle() {
    setState(() {
      animatedChild = subtitleEmpty;
    });
  }

  void showSubtitle() {
    setState(() {
      animatedChild = subtitle;
    });
  }

  @override
  void initState() {
    super.initState();
    animatedChild = subtitleEmpty;
    // Text fades in after the page is rendered.
    WidgetsBinding.instance.addPostFrameCallback((_) => showSubtitle());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
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
            AnimatedSwitcher(
              duration: const Duration(seconds: 2),
              child: animatedChild,
            ),
          ],
        ),
      ),
    );
  }
}
