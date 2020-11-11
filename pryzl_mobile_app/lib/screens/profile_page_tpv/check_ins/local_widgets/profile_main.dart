import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/screens/profile_page_tpv/check_ins/local_widgets/app_bar.dart';
import 'package:pryzlmobileapp/types/icons/pryz_map_icons.dart';

/// This is the top screen for Profile page
/// which contains four buttons:
/// Followers: a class is needed to show the follower number.
/// Follow: a dropdown button.
/// Following: a class is needed to show following number.
/// Share: a dropdown button.
///
/// Another class is needed to show
/// profile picture, name, mantra, website, and location.

class ProfileMain extends StatefulWidget {
  @override
  _ProfileMainState createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(360),
      child: Stack(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(376),
            color: Color.fromARGB(255, 249, 113, 95),
          ),
          Positioned(
            top: ScreenUtil().setHeight(90),
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  color: Color.fromARGB(255, 252, 149, 135),
                  child: Container(
                    alignment: FractionalOffset(0.3, 1),
                    height: ScreenUtil().setHeight(32.05),
                    width: ScreenUtil().setWidth(150),
                    child: Text(
                      '270\n${Strings.followers}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: ScreenUtil().setSp(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                Container(
                  width: ScreenUtil().setWidth(150),
                  child: Stack(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 235, 180),
                            border: Border.all(
                                color: Color.fromARGB(255, 249, 113, 95))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DropdownButton(
                              iconSize: 20,
                              onChanged: (value) {},
                              items: <String>[
                                'One',
                                'Two',
                                '3',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(65),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(0)),
                          color: Color.fromARGB(255, 249, 113, 95),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(10), 0, 0, 0),
                          child: Text(
                            Strings.follow,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenUtil().setSp(12),
                                color: PryzColor.lightBackground),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(90),
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  color: Color.fromARGB(255, 252, 149, 135),
                  child: Container(
                    alignment: FractionalOffset(0.7, 0),
                    height: ScreenUtil().setHeight(32.05),
                    width: ScreenUtil().setWidth(150),
                    child: Text(
                      '165\n${Strings.following}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: ScreenUtil().setSp(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
                Container(
                  width: ScreenUtil().setWidth(100),
                  child: Stack(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(80),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 255, 235, 180),
                            border: Border.all(
                                color: Color.fromARGB(255, 249, 113, 95))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            DropdownButton(
                              iconSize: 20,
                              onChanged: (value) {},
                              items: <String>[
                                'One',
                                'Two',
                                '3',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              elevation: 0,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(65),
                        height: ScreenUtil().setHeight(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10),
                              right: Radius.circular(0)),
                          color: Color.fromARGB(255, 249, 113, 95),
                        ),
                        child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.fromLTRB(
                              ScreenUtil().setWidth(10), 0, 0, 0),
                          child: Text(
                            Strings.share,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: ScreenUtil().setSp(12),
                                color: PryzColor.lightBackground),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: ScreenUtil().setHeight(75),
            left: ScreenUtil().setWidth(121),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: ScreenUtil().setWidth(66),
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: ScreenUtil().setWidth(60),
                    backgroundImage: AssetImage('assets/images/cat.jpg'),
                  ),
                ),
                Container(
                  child: Text(
                    'A Cute Cat',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    'A mantra goes here',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: ScreenUtil().setSp(10),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(30),
                  width: ScreenUtil().setWidth(85),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: PryzMapIcons.earth,
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setWidth(25),
                        top: ScreenUtil().setHeight(10),
                        child: Text(
                          'www.cat.com',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: ScreenUtil().setSp(8),
                              color: PryzColor.mainOrange),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(30),
                  width: ScreenUtil().setWidth(85),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          child: PryzMapIcons.mapPinLocation,
                        ),
                      ),
                      Positioned(
                        left: ScreenUtil().setWidth(25),
                        top: ScreenUtil().setHeight(10),
                        child: Text(
                          'Berlin, Germany',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: ScreenUtil().setSp(8),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBarTPV(),
          )
        ],
      ),
    );
  }
}
