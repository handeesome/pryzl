import 'package:flutter/material.dart';
import 'package:pryzlmobileapp/widgets/pryz_dialogs.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A Pryzl-themed button. It has two variations [PryzButton.primary]
/// and [PryzButton.secondary].
class PryzButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double height;
  final double minWidth;
  final Color color;
  final ShapeBorder shapeBorder;
  final String fontFamily;
  final double letterSpacing;

  /// Rounded rectangle border for [PryzButton.primary].
  static const ShapeBorder _shapeBorderPrimary = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  );

  /// Rounded rectangle border for [PryzButton.secondary].
  static const ShapeBorder _shapeBorderSecondary = RoundedRectangleBorder(
    side: BorderSide(color: PryzColor.mainOrange),
    borderRadius: BorderRadius.all(
      Radius.circular(5),
    ),
  );

  /// PryzButton primary variation constructor.
  ///
  /// The button is functional only if [PryzButton.text] and
  /// [PryzButton.onPressed] are passed.
  /// The other parameters only enforce specific [FlatButton] properties.
  const PryzButton.primary({
    this.text,
    this.onPressed,
    this.minWidth,
    this.height = 46,
    this.color = PryzColor.mainOrange,
    this.shapeBorder = _shapeBorderPrimary,
    this.fontFamily = 'Montserrat',
    this.letterSpacing = 3,
  });

  /// PryzButton secondary variation constructor.
  ///
  /// The button is functional only if [PryzButton.text] and
  /// [PryzButton.onPressed] are passed.
  /// The other parameters only enforce specific [FlatButton] properties.
  const PryzButton.secondary({
    this.text,
    this.onPressed,
    this.minWidth,
    this.height = 46,
    this.color = Colors.transparent,
    this.shapeBorder = _shapeBorderSecondary,
    this.fontFamily = 'Montserrat',
    this.letterSpacing = 3,
  });

  /// PryzButton dialog button constructor.
  ///
  /// The button is functional only if [PryzButton.text] and
  /// [PryzButton.onPressed] are passed.
  /// The other parameters only enforce specific [FlatButton] properties.
  ///
  /// [PryzButton.dialog] button is mainly used in [PryzDialog].
  const PryzButton.dialog({
    this.text,
    this.onPressed,
    this.minWidth,
    this.height,
    this.color,
    this.shapeBorder,
    this.fontFamily = 'OpenSans',
    this.letterSpacing = 1,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: height ?? 0,
      minWidth: minWidth ?? 0,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: ScreenUtil().setSp(16),
            letterSpacing: letterSpacing,
          ),
        ),
        color: color,
        shape: shapeBorder,
      ),
    );
  }
}
