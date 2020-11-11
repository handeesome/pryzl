import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';

class IdConfirmationStep extends StatefulWidget {
  final PageController controller;

  const IdConfirmationStep({this.controller});

  @override
  _IdConfirmationStepState createState() => _IdConfirmationStepState();
}

class _IdConfirmationStepState extends State<IdConfirmationStep> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(33), right: ScreenUtil().setWidth(33)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Code Confirmation page'),
          PryzButton.primary(
            minWidth: ScreenUtil().setWidth(309),
            text: Strings.next,
            onPressed: () {
              widget.controller.animateToPage(2,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
          ),
        ],
      ),
    );
  }
}
