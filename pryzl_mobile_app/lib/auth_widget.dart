import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/screens/home_page/home_page.dart';
import 'package:pryzlmobileapp/screens/landing_page/landing_page.dart';

/// Builds the signed-in or non signed-in UI, depending on the user snapshot.
///
/// This widget should be below the [MaterialApp].
/// An [AuthWidgetBuilder] ancestor is required for this widget to work.
class AuthWidget extends StatelessWidget {
  const AuthWidget({Key key, @required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<FirebaseUser> userSnapshot;

  @override
  Widget build(BuildContext context) {
    // Be sure to set the page in the MaterialApp's home/initialRoute(ie the
    // entry file, just set it once) to ensure that the fit size is set before
    // each use.
    // The design is based on the size of iPhone X, Xs, 11 Pro (​​375x812)
    ScreenUtil.init(context, width: 375, height: 812, allowFontScaling: true);

    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? HomePage() : LandingPage();
    }

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
