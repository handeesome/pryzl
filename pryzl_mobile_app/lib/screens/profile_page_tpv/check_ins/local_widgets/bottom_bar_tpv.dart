import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/types/icons/pryz_basic_icons.dart';
import 'package:pryzlmobileapp/types/icons/pryz_notification_icons.dart';

///This is a simple version of Bottom Navigation Bar.
///The positions of each button are not correct but this class will
///have to be replaced eventually.

class BottomBarTPV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: ScreenUtil().setHeight(83),
        color: Color(0xFAFAFA),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RawMaterialButton(
              onPressed: () {},
              elevation: 0,
              fillColor: Color.fromARGB(255, 194, 194, 194),
              child: PryzBasicIcons.home,
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 0,
              fillColor: Color.fromARGB(255, 194, 194, 194),
              child: Icon(Icons.search),
              shape: CircleBorder(),
            ),
            ClipOval(
              child: Material(
                color: PryzColor.mainOrange, // button color
                child: InkWell(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: PryzBasicIcons.plus,
                  ),
                  onTap: () {},
                ),
              ),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 0,
              fillColor: Color.fromARGB(255, 194, 194, 194),
              child: PryzNotificationIcons.bell,
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 0,
              fillColor: Color.fromARGB(255, 194, 194, 194),
              child: Icon(Icons.person_outline),
              shape: CircleBorder(),
            )
          ],
        ),
      ),
    );
  }
}
