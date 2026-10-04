import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/widgets/Buttons/primary_btn.dart';
import 'package:shopping/core/widgets/Buttons/secoundary_btn.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .start,
          children: [
            Center(
              child: Image.asset(
                "assets/images/hello.png",
                width: 345,
                height: 262,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Text(
                textAlign: .center,
                "Hello!",
                style: TextStyle(
                  fontWeight: .w500,
                  fontSize: 48,
                  color: ColorsApp.text,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 80),
          child: SizedBox(
            height: 112,
            child: Column(
              spacing: 16,
              children: [
                PrimaryBtn(
                  text: "Sign Up",
                  height: 48,
                  width: 343,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed("register");
                  },
                ),
                SecoundaryBtn(
                  text: "Login",
                  height: 48,
                  width: 343,
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).pushNamed("login");
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
