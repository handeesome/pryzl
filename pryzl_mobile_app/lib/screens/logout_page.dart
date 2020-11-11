import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/services/firebase_auth_service.dart';
import 'package:pryzlmobileapp/types/pryz_exception.dart';
import 'package:pryzlmobileapp/widgets/pryz_button.dart';

class LogoutPage extends StatelessWidget {
  Future<void> _signOut(BuildContext context) async {
    try {
      var auth = Provider.of<FirebaseAuthService>(context, listen: false);
      await auth.signOut();
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      print('Logged out.');
      Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
    } catch (e) {
      // TODO(Anyone): Log this event with logger.w, https://pryzl.atlassian.net/browse/PRYZ-105
      print(e);
      throw PryzException(3007);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placeholder Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            PryzButton.primary(
              text: Strings.logout,
              //minWidth: 200,
              onPressed: () => _signOut(context),
            ),
          ],
        ),
      ),
    );
  }
}
