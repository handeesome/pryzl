import 'package:flutter/material.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: PryzColor.darkBackground,
  primaryColor: PryzColor.darkBackground,
  appBarTheme: AppBarTheme(
      color: PryzColor.darkBackground,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        headline3: TextStyle(color: Colors.white),
        headline4: TextStyle(color: PryzColor.lightBackground),
      )),
  bottomAppBarColor: PryzColor.darkBackground,
  textTheme: Typography.whiteCupertino.apply(
    fontFamily: 'OpenSans',
    displayColor: Colors.white,
    bodyColor: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(color: PryzColor.lightBackground),
    labelStyle: TextStyle(
      color: PryzColor.lightBackground,
    ),
  ),
  buttonColor: Color.fromRGBO(96, 96, 96, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.black,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
        border: Border(
      bottom: BorderSide(
        color: Colors.white,
      ),
    )),
    unselectedLabelColor: Colors.white,
    unselectedLabelStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 17,
      fontWeight: FontWeight.w300,
    ),
    labelColor: Colors.white,
    labelStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    backgroundColor: PryzColor.darkBackground,
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    contentTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.white,
    ),
  ),
);

final lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: PryzColor.lightBackground,
  scaffoldBackgroundColor: PryzColor.lightBackground,
  appBarTheme: AppBarTheme(
    color: PryzColor.lightBackground,
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
  ),
  bottomAppBarColor: PryzColor.lightBackground,
  textTheme: Typography.blackCupertino.apply(
    fontFamily: 'OpenSans',
    displayColor: Colors.black,
    bodyColor: Colors.black,
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
        border: Border(
      bottom: BorderSide(color: Colors.black, width: 1),
    )),
    unselectedLabelColor: Colors.black,
    unselectedLabelStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 17,
      fontWeight: FontWeight.w300,
    ),
    labelColor: Colors.black,
    labelStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    backgroundColor: PryzColor.lightBackground,
    titleTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    contentTextStyle: TextStyle(
      fontFamily: 'OpenSans',
      color: Colors.black,
    ),
  ),
  buttonColor: Color.fromRGBO(232, 232, 232, 1),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color.fromRGBO(250, 250, 250, 1),
  ),
);
