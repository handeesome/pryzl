import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pryzlmobileapp/screens/home_page/home_page.dart';
import 'package:pryzlmobileapp/screens/logout_page.dart';
import 'package:pryzlmobileapp/constants/pryz_strings.dart';
import 'package:pryzlmobileapp/screens/profile_page_tpv/check_ins/profile_page_tpv.dart';
import 'auth_widget.dart';
import 'auth_widget_builder.dart';
import 'constants/themes.dart';
import 'screens/register_page/email_or_phone.dart';
import 'screens/register_page/register_choice.dart';
import 'services/firebase_auth_service.dart';

/// Entry point of the app.
///
/// The [runApp()] function takes the [PryzApp] widget and
/// makes it the root of the widget tree.
void main() {
  runApp(PryzApp());
}

/// A material widget that the is the root of the widget tree.
///
/// The [SystemChrome.setPreferredOrientations()] method prevents the app
/// from changing its orientation and forces the layout to stick to portrait
/// mode. The app supports both light and dark modes. The home page is Landing
/// Page. Routes enable the app to navigate through different screens.
class PryzApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Restrict landscape mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiProvider(
      providers: [
        Provider<FirebaseAuthService>(
          create: (_) => FirebaseAuthService(),
        ),
      ],
      child: AuthWidgetBuilder(builder: (context, userSnapshot) {
        return MaterialApp(
          title: Strings.appName,
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          routes: {
            'HomePage': (context) => HomePage(),
            'LoginPage': (context) => ProPageTPV(),
            'LogoutPage': (context) => LogoutPage(),
            'RegisterPage': (context) => EmailOrPhone(),
            'RegisterChoice': (context) => RegisterChoice(),
          },
          home: AuthWidget(userSnapshot: userSnapshot),
        );
      }),
    );
  }
}
