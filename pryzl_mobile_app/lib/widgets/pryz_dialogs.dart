import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';

/// A class holding static calls to open dialogs in a page.
class PryzDialog {
  /// Opens a non-dismissible [SimpleDialog] asking the user to wait.
  ///
  /// The dialog can be closed using [closeDialog] method in [PryzDialog]
  /// or directly in the route code using [Navigator.pop].
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(key: key, children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(PryzColor.mainOrange),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(10),
                    ),
                    Text(
                      'Please Wait....',
                    )
                  ]),
                )
              ]));
        });
  }

  /// Closes an opened [Dialog], either [SimpleDialog] or [AlertDialog].
  ///
  /// Be aware that this is simply a 'Return' call. So, if there is no Dialog
  /// open, you will be taken to the previous page instead.
  static Future<void> closeDialog(BuildContext context) async {
    return Navigator.of(context).pop();
  }

  /// Opens a [AlertDialog] displaying a [title] and a [message].
  ///
  /// The default action is a 'Okay' [FlatButton] that simply closes the dialog.
  ///
  /// if provided, an additional [Widget] can be added as an [action]. Usually,
  /// it's a [FlatButton] that executes some code before closing the dialog.
  static Future<void> showMessageDialog({
    BuildContext context,
    GlobalKey key,
    String title,
    String message,
    Widget action,
  }) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: <Widget>[
              action,
              PryzButton.dialog(
                text: 'Okay',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }
}
