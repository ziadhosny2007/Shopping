import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () async {
      SharedPreferencesAsync isFirstTime = SharedPreferencesAsync();
      bool? flage = await isFirstTime.getBool("flage");
      if (flage == false) {
        Navigator.of(context).pushReplacementNamed("hello");
      } else {
        Navigator.of(context).pushReplacementNamed("onboarding");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInLeft(
        delay: Duration(seconds: 1),
        animate: true,
        child: Center(
          child: Image.asset("assets/icons/icon.png", width: 362, height: 362),
        ),
      ),
    );
  }
}
