import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopping/core/widgets/Buttons/primary_btn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int index = 0;
  PageController? controller;
  SharedPreferencesAsync isFirstTime = SharedPreferencesAsync();

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil("hello", (route) => false);
            },
            child: Text(
              "Skip",
              style: Theme.of(context).primaryTextTheme.bodySmall,
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .start,
          spacing: 8,
          children: [
            SizedBox(
              height: 315,
              width: 343,
              child: PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                itemCount: onboarding.length,
                itemBuilder: (context, i) {
                  return FadeInDown(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(onboarding[i]["image"]),
                    ),
                  );
                },
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: index,
              count: onboarding.length,
              effect: WormEffect(),
            ),
            SizedBox(height: 74),

            FadeInUp(
              child: Text(
                "${onboarding[index]["title"]}",
                style: Theme.of(context).primaryTextTheme.bodyLarge,
              ),
            ),
            FadeInDown(
              child: SizedBox(
                width: 240,
                child: Text(
                  "${onboarding[index]["des"]}",
                  textAlign: .center,
                  style: Theme.of(context).primaryTextTheme.displayMedium,
                ),
              ),
            ),
            SizedBox(height: 50),

            PrimaryBtn(
              text: (index == 0) ? "Next" : "Get Started",
              onPressed: () async {
                if (index == 0) {
                  controller!.animateToPage(
                    1,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeIn,
                  );
                } else {
                  await isFirstTime.setBool("flage", false);
                  Navigator.of(
                    context,
                  ).pushNamedAndRemoveUntil("hello", (route) => false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<Map> onboarding = [
  {
    "title": "Discover Trends",
    "des": "Now we are here to provide variety of the best fashion",
    "image": "assets/images/onboarding1.png",
  },
  {
    "title": "Latest out fit",
    "des": "Express your self through the art of the fashionism",
    "image": "assets/images/onboarding2.png",
  },
];
