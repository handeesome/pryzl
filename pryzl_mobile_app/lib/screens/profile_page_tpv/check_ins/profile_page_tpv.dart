import 'package:flutter/material.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/screens/profile_page_tpv/check_ins/local_widgets/bottom_bar_tpv.dart';
import 'package:pryzlmobileapp/screens/profile_page_tpv/check_ins/local_widgets/tpv_body.dart';

/// This Screen is the Check_Ins screen in profile page.
/// The AppBar is inside body, so that the profile picture can
/// overlay on the AppBar

class ProPageTPV extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PryzColor.lightBackground,
      body: ProTop(),
      bottomNavigationBar: BottomBarTPV(),
    );
  }
}
