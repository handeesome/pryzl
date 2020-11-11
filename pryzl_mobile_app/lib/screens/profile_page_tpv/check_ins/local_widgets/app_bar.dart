import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/types/icons/pryz_arrow_icons.dart';
import 'package:pryzlmobileapp/types/icons/pryz_basic_icons.dart';

///This is the appBar of profile-page
///which only contains an arrow icon, title, and an option icon.

class AppBarTPV extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: PryzArrowIcons.arrowLeft,
      ),
      title: Text(
        'Profile',
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            color: PryzColor.lightBackground),
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: PryzBasicIcons.options,
          onPressed: () {},
        )
      ],
    );
  }
}
