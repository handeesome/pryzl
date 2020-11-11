import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// A screen that is the home page of the app.
///
/// It consists of the bottom navigation bar and different body screens
/// depending in the selected tab index.
/// https://www.figma.com/file/lMtqUvoC08R896tmwtXiUW/Profile-Page?node-id=368%3A0
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem buildNavBarItem(
      int index, EdgeInsets iconPadding, Icon icon,
      [bool isAdd = false]) {
    var brightness = MediaQuery.of(context).platformBrightness;
    var darkModeOn = brightness == Brightness.dark;

    return BottomNavigationBarItem(
      icon: FlatButton(
        color: isAdd
            ? Color.fromRGBO(249, 113, 95, 1)
            : Theme.of(context).buttonColor,
        onPressed: () {
          _onItemTapped(index);
        },
        child: icon,
        padding: iconPadding,
        shape: CircleBorder(
          side: BorderSide(
            color: darkModeOn ? Colors.white : Colors.black,
            width: 1,
            style:
                _selectedIndex == index ? BorderStyle.solid : BorderStyle.none,
          ),
        ),
      ),
      title: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          Center(child: Text('Home')),
          Center(child: Text('Search')),
          Center(child: Text('Add')),
          Center(child: Text('Notifications')),
          Center(child: Text('Profile')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildNavBarItem(
            0,
            EdgeInsets.all(ScreenUtil().setWidth(7.67)),
            Icon(
              Icons.home,
              size: ScreenUtil().setWidth(25),
            ),
          ),
          buildNavBarItem(
            1,
            EdgeInsets.all(ScreenUtil().setWidth(7.67)),
            Icon(
              Icons.search,
              size: ScreenUtil().setWidth(25),
            ),
          ),
          buildNavBarItem(
              2,
              EdgeInsets.all(ScreenUtil().setWidth(11)),
              Icon(
                Icons.add,
                size: ScreenUtil().setWidth(25),
              ),
              true),
          buildNavBarItem(
            3,
            EdgeInsets.all(ScreenUtil().setWidth(7.67)),
            Icon(
              Icons.notifications,
              size: ScreenUtil().setWidth(25),
            ),
          ),
          buildNavBarItem(
            4,
            EdgeInsets.all(ScreenUtil().setWidth(7.67)),
            Icon(
              Icons.account_circle,
              size: ScreenUtil().setWidth(25),
            ),
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
