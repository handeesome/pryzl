import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/screens/profile_page_tpv/check_ins/local_widgets/profile_main.dart';
import 'package:pryzlmobileapp/screens/profile_page_tpv/check_ins/local_widgets/tpv_rating_bars.dart';
import 'package:pryzlmobileapp/types/icons/pryz_basic_icons.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

/// This screen contains profile_main.dart
/// with a list of check_ins.
/// Every bar will have a separate class, which contains
/// a picture, restaurant name, and rating.
class ProTop extends StatefulWidget {
  @override
  _ProTopState createState() => _ProTopState();
}

class _ProTopState extends State<ProTop> {
  static final List _itemContentList = [
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.0,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.5,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.0,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.5,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.0,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.5,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.0,
    },
    {
      'picture': 'assets/images/cat.jpg',
      'name': 'cat',
      'rating': 3.5,
    }
  ];

  static Widget getItemWidget(List list, int index, BuildContext context) {
    var item = list[index];
    Widget checkInItems = Slidable(
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.2,
      secondaryActions: [
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext bc) {
                  return Container(
                    height: ScreenUtil().setHeight(295),
                    width: ScreenUtil().setWidth(375),
                    color: PryzColor.lightBackground,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PryzButton.primary(
                          onPressed: () {},
                          text: Strings.fullView,
                          minWidth: ScreenUtil().setWidth(327),
                          height: ScreenUtil().setHeight(51),
                          shapeBorder: RoundedRectangleBorder(
                            side: BorderSide(color: PryzColor.mainOrange),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(19),
                        ),
                        PryzButton.primary(
                          onPressed: () {},
                          text: Strings.shareReview,
                          minWidth: ScreenUtil().setWidth(327),
                          height: ScreenUtil().setHeight(51),
                          shapeBorder: RoundedRectangleBorder(
                            side: BorderSide(color: PryzColor.mainOrange),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(19),
                        ),
                        PryzButton.primary(
                          onPressed: () {},
                          text: Strings.report,
                          minWidth: ScreenUtil().setWidth(327),
                          height: ScreenUtil().setHeight(51),
                          shapeBorder: RoundedRectangleBorder(
                            side: BorderSide(color: PryzColor.mainOrange),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(19),
                        ),
                        PryzButton.primary(
                          onPressed: () {},
                          text: Strings.cancel,
                          minWidth: ScreenUtil().setWidth(327),
                          height: ScreenUtil().setHeight(51),
                          color: PryzColor.lightBackground,
                        )
                      ],
                    ),
                  );
                });
          },
          child: Container(
            width: ScreenUtil().setWidth(80),
            height: ScreenUtil().setHeight(70),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  right: 25,
                  child: PryzBasicIcons.moreHorizontal,
                ),
                Positioned(
                  right: 20,
                  bottom: 5,
                  child: Text(Strings.more),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                right: Radius.circular(15),
              ),
              color: PryzColor.goldAccent,
            ),
          ),
        ),
      ],
      child: Stack(children: [
        TpvRatingBar(),
        Container(
          width: ScreenUtil().setWidth(300),
          height: ScreenUtil().setHeight(70),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(15)),
            color: Color.fromARGB(255, 255, 235, 180),
          ),
          child: Stack(
            children: [
              Positioned(
                left: ScreenUtil().setWidth(10),
                top: ScreenUtil().setHeight(15),
                child: CircleAvatar(
                  radius: ScreenUtil().setHeight(20),
                  backgroundImage: AssetImage(item['picture']),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(20),
                left: ScreenUtil().setWidth(50),
                child: Container(
                  child: Text(
                    item['name'],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(18),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                top: ScreenUtil().setHeight(20),
                right: ScreenUtil().setWidth(0),
                child: SmoothStarRating(
                  color: PryzColor.mainOrange,
                  borderColor: PryzColor.mainOrange,
                  rating: item['rating'],
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
      ]),
    );
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(19),
          ),
          checkInItems,
        ],
      ),
    );
  }

  final Widget _buildLV = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: _itemContentList.length,
      itemBuilder: (buildContext, index) {
        return getItemWidget(_itemContentList, index, buildContext);
      });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProfileMain(),
          SizedBox(
            height: ScreenUtil().setHeight(26),
          ),
          Container(
            alignment: Alignment.center,
            height: ScreenUtil().setHeight(48),
            width: ScreenUtil().setWidth(341),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: PryzColor.mainOrange,
            ),
            child: Text(
              Strings.checkIns,
              style: TextStyle(
                color: PryzColor.lightBackground,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(16),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            child: Expanded(child: _buildLV),
          ),
        ],
      ),
    );
  }
}
