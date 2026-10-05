import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/theme.dart';
import 'package:shopping/core/routes/routes.dart';
import 'package:shopping/core/screens/splash.dart';

void main() {
  runApp(MyApp());
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
