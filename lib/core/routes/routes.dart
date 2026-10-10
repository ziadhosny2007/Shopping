import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/screens/hello.dart';
import 'package:shopping/core/screens/onboarding.dart';
import 'package:shopping/core/screens/splash.dart';
import 'package:shopping/features/app_section/view/app_section.dart';

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
    // login: (context) => BlocProvider(
    //   create: (context) => serviceLocator<LoginCubit>(),
    //   child: Login(),
    // ),

    // register: (context) => BlocProvider(
    //   create: (context) => serviceLocator<RegisterCubit>(),
    //   child: Register(),
    // ),
    // cart: (context) => Cart(),
    // account: (context) => Account(),
    // favourite: (context) => Favourite(),
    splash: (context) => Splash(),
    appSection: (context) => AppSection(),
    onboarding: (context) => Onboarding(),
    //     resetPassword: (context) => ResetPassword(),
    hello: (context) => Hello(),
  };
}
