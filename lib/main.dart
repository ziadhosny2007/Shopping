import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/Themes/theme.dart';
import 'package:shopping/core/bloc_observer.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/routes/routes.dart';
import 'package:shopping/core/screens/splash.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
  Bloc.observer = MyBlocObserver();
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: Routes.routes,
      theme: AppTheme.mode,
      home: Splash(),
    );
  }
}
//@ziadZIAD2007