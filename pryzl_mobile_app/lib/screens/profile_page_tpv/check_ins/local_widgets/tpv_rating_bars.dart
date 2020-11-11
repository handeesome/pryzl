import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

/// This widget is a dropdown button, which has one description and
/// five factors:
/// Quality, Service, Ambiance, Cleanliness, and Price.
/// These factors all contain one rating bar
///
/// For these rating bars to be able to change,
/// [isReadOnly] needs to be set to false
class TpvRatingBar extends StatefulWidget {
  @override
  _TpvRatingBarState createState() => _TpvRatingBarState();
}

class _TpvRatingBarState extends State<TpvRatingBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(340),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 194, 194, 194),
      ),
      child: ExpansionTile(
        title: Text(''),
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(37),
            width: ScreenUtil().setWidth(340),
            color: PryzColor.lightBackground,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'One of the best restaurants in town. 10/10 would recommend.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setSp(10),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(37),
            width: ScreenUtil().setWidth(340),
            color: PryzColor.goldAccent,
            child: Stack(
              children: [
                Positioned(
                  left: ScreenUtil().setWidth(14),
                  top: ScreenUtil().setHeight(11),
                  child: Text(
                    Strings.quality,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(5),
                  child: SmoothStarRating(
                    color: PryzColor.mainOrange,
                    borderColor: PryzColor.mainOrange,
                    rating: 3,
                    isReadOnly: true,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    onRated: (value) {
                      print('rating value-> $value');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(37),
            width: ScreenUtil().setWidth(340),
            color: PryzColor.lightBackground,
            child: Stack(
              children: [
                Positioned(
                  left: ScreenUtil().setWidth(14),
                  top: ScreenUtil().setHeight(11),
                  child: Text(
                    Strings.service,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(5),
                  child: SmoothStarRating(
                    color: PryzColor.mainOrange,
                    borderColor: PryzColor.mainOrange,
                    rating: 3,
                    isReadOnly: true,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    onRated: (value) {
                      print('rating value-> $value');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(37),
            width: ScreenUtil().setWidth(340),
            color: PryzColor.goldAccent,
            child: Stack(
              children: [
                Positioned(
                  left: ScreenUtil().setWidth(14),
                  top: ScreenUtil().setHeight(11),
                  child: Text(
                    Strings.ambiance,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(5),
                  child: SmoothStarRating(
                    color: PryzColor.mainOrange,
                    borderColor: PryzColor.mainOrange,
                    rating: 3,
                    isReadOnly: true,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    onRated: (value) {
                      print('rating value-> $value');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(37),
            width: ScreenUtil().setWidth(340),
            color: PryzColor.lightBackground,
            child: Stack(
              children: [
                Positioned(
                  left: ScreenUtil().setWidth(14),
                  top: ScreenUtil().setHeight(11),
                  child: Text(
                    Strings.cleanliness,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(5),
                  child: SmoothStarRating(
                    color: PryzColor.mainOrange,
                    borderColor: PryzColor.mainOrange,
                    rating: 3,
                    isReadOnly: true,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    onRated: (value) {
                      print('rating value-> $value');
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(37),
            width: ScreenUtil().setWidth(340),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
              color: PryzColor.goldAccent,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: ScreenUtil().setWidth(14),
                  top: ScreenUtil().setHeight(11),
                  child: Text(
                    Strings.price,
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(14)),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(5),
                  child: SmoothStarRating(
                    color: PryzColor.mainOrange,
                    borderColor: PryzColor.mainOrange,
                    rating: 3,
                    isReadOnly: true,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    onRated: (value) {
                      print('rating value-> $value');
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
