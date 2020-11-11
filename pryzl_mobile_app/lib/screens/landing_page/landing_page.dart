import 'package:flutter/material.dart';
import 'local_widgets/landing_page_body.dart';
import 'local_widgets/landing_page_bottom.dart';

/// A landing page of the app if the user is not authenticated.
///
/// It consists of the body and the bottom containers.
/// https://www.figma.com/file/Ey7pifYlUBkG83req2aNcs/Draft-pryzl?node-id=72%3A4
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LandingPageBody(),
      bottomNavigationBar: LandingPageBottom(),
    );
  }
}
