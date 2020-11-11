import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pryzlmobileapp/constants/country_codes.dart';
import 'package:pryzlmobileapp/constants/pryz_color.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/types/pryz_input_decoration.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';

import '../password_recovery.dart';

class PhoneEmailStep extends StatefulWidget {
  final controller;

  const PhoneEmailStep({this.controller});

  @override
  _PhoneEmailStepState createState() => _PhoneEmailStepState();
}

class _PhoneEmailStepState extends State<PhoneEmailStep>
    with TickerProviderStateMixin {
  TabController _tabController;
  final _formKey = GlobalKey<FormBuilderState>();
  String countryCode;
  final TextStyle hintStyle = TextStyle(
    color: Colors.grey,
    fontSize: ScreenUtil().setSp(17),
    fontWeight: FontWeight.w300,
  );

  // TODO(TBD): add this method to the phone class.
  String getCountryCode(String phone) {
    var country;
    if (phone.length <= 5) {
      country = codes.firstWhere((country) => country['dial_code'] == phone,
          orElse: () {
        return null;
      });
    }
    return country['code'];
  }

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    countryCode = 'DE';
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(33), right: ScreenUtil().setWidth(33)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: PryzColor.greyAccent),
              ),
            ),
            child: TabBar(
              controller: _tabController,
              onTap: (index) {
                FocusScope.of(context).unfocus();
              },
              tabs: <Widget>[
                Tab(
                  text: Strings.phone,
                ),
                Tab(
                  text: Strings.email,
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(100),
            child: FormBuilder(
              key: _formKey,
              initialValue: {
                'phone': '+49',
                'email': '',
              },
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
                    child: PryzInputDecoration.embeddedContainer(
                      context: context,
                      child: Stack(
                        children: [
                          FormBuilderTextField(
                            attribute: 'phone',
                            onChanged: (phone) {
                              setState(() {
                                countryCode = getCountryCode(phone);
                              });
                            },
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            validators: [
                              FormBuilderValidators.numeric(),
                              FormBuilderValidators.required()
                            ],
                            onFieldSubmitted: (phoneNumber) {
                              _formKey.currentState.save();
                              FocusScope.of(context).unfocus();
                            },
                            decoration:
                                PryzInputDecoration.mainInputDecoration()
                                    .copyWith(
                              hintText: Strings.passwordRecoveryPhoneHint,
                              contentPadding: EdgeInsets.only(
                                left: ScreenUtil().setWidth(60),
                                top: ScreenUtil().setHeight(8),
                                bottom: ScreenUtil().setHeight(7),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment(-0.9, -0.62),
                            child: Text('$countryCode', style: hintStyle),
                          ),
                          Container(
                            alignment: Alignment(-0.70, -0.65),
                            child: Text('|', style: hintStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(39)),
                    child: PryzInputDecoration.embeddedContainer(
                      context: context,
                      child: FormBuilderTextField(
                        attribute: 'email',
                        decoration: PryzInputDecoration.mainInputDecoration(
                          hint: Strings.email,
                        ),
                        textInputAction: TextInputAction.done,
                        validators: [
                          FormBuilderValidators.email(),
                          FormBuilderValidators.required()
                        ],
                        onFieldSubmitted: (email) {
                          _formKey.currentState.save();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(32),
          ),
          PryzButton.primary(
            text: Strings.next,
            minWidth: ScreenUtil().setWidth(309),
            onPressed: () {
              FocusScope.of(context).unfocus();
              var form = Provider.of<ResetPasswordForm>(context, listen: false);
              if (_tabController.index == 0 &&
                  _formKey.currentState.fields['phone'].currentState
                      .validate()) {
                form.phoneNumber =
                    _formKey.currentState.fields['phone'].currentState.value;
                widget.controller.animateToPage(1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              } else if (_tabController.index == 1 &&
                  _formKey.currentState.fields['email'].currentState
                      .validate()) {
                form.email =
                    _formKey.currentState.fields['email'].currentState.value;
                widget.controller.animateToPage(1,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeIn);
              }
            },
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
