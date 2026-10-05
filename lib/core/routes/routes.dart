// import 'package:shopping/appSection/account.dart';
// import 'package:shopping/appSection/app_section.dart';
// import 'package:shopping/appSection/cart.dart';
// import 'package:shopping/appSection/favourite.dart';
// import 'package:shopping/appSection/home.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/core/screens/hello.dart';
// import 'package:shopping/core/screens/login.dart';
import 'package:shopping/core/screens/onboarding.dart';
// import 'package:shopping/core/screens/register.dart';
// import 'package:shopping/core/screens/reset_password.dart';
import 'package:shopping/core/screens/splash.dart';

abstract class Routes {
  static String login = "login";
  static String register = "register";
  static String home = "home";
  static String hello = "hello";
  static String onboarding = "onboarding";
  static String resetPassword = "resetPassword";
  static String splash = "splash";
  static String account = "account";
  static String favourite = "favourite";
  static String cart = "cart";
  static String appSection = "appSection";

  static Map<String, WidgetBuilder> routes = {
    //     login: (context) => Login(),
    //     register: (context) => Register(),
    //     cart: (context) => Cart(),
    //     account: (context) => Account(),
    //     favourite: (context) => Favourite(),
    splash: (context) => Splash(),
    //     appSection: (context) => AppSection(),
    onboarding: (context) => Onboarding(),
    //     home: (context) => Home(),
    //     resetPassword: (context) => ResetPassword(),
    hello: (context) => Hello(),
  };
}
