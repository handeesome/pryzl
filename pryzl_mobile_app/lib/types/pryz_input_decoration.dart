import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/// A class that provides decoration and widgets for input fields.
class PryzInputDecoration {
  /// A Pryzl themed rectangle with gradient light colors.
  static const BoxDecoration embeddedEffectLight = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0, -0.75),
      stops: [0.5, 0.7, 1],
      colors: [
        Color.fromRGBO(151, 162, 171, 0.5),
        Color.fromRGBO(151, 162, 171, 0.2),
        Colors.transparent
      ],
    ),
  );

  /// A Pryzl themed rectangle with gradient dark colors.
  static const BoxDecoration embeddedEffectDark = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment(0, -0.70),
      stops: [0.2, 0.5, 0.7, 1],
      colors: [
        Color.fromRGBO(0, 0, 0, 0.8),
        Color.fromRGBO(0, 0, 0, 0.5),
        Color.fromRGBO(0, 0, 0, 0.2),
        Colors.transparent
      ],
    ),
  );

  /// A [Container] decorated with [embeddedEffectLight] in light mode,
  /// or [embeddedEffectDark] in dark mode.
  ///
  /// [context] is required because it is used to get the current brightness,
  /// otherwise the gradient colors don't switch correctly in dark mode.
  static Widget embeddedContainer({
    @required context,
    Widget child,
    double width,
    double height,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: MediaQuery.of(context).platformBrightness == Brightness.dark
          ? PryzInputDecoration.embeddedEffectDark
          : PryzInputDecoration.embeddedEffectLight,
      child: child,
    );
  }

  /// A decoration used in [TextField], [FormField], etc...
  ///
  /// it is possible to use this base decoration and add other parameters to it
  /// using [mainInputDecoration.copyWith]. It is useful when customizing
  /// specialized input fields.
  static InputDecoration mainInputDecoration({String hint, String label}) {
    return InputDecoration(
      labelText: label ?? null,
      labelStyle: TextStyle(
        fontFamily: 'OpenSans',
      ),
      hintText: hint ?? null,
      hintStyle: TextStyle(
        fontFamily: 'OpenSans',
        fontSize: ScreenUtil().setSp(17),
        fontWeight: FontWeight.w300,
      ),
      isDense: true,
      contentPadding: EdgeInsets.only(
          top: ScreenUtil().setHeight(9),
          left: ScreenUtil().setWidth(15),
          bottom: ScreenUtil().setHeight(9)),
      filled: true,
      fillColor: Color.fromRGBO(151, 162, 171, 0.1),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color.fromRGBO(210, 134, 97, 1),
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color.fromRGBO(151, 162, 171, 1),
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Colors.red,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(
          color: Color.fromRGBO(151, 162, 171, 1),
          width: 1,
        ),
      ),
    );
  }
}
