import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,
        mainAxisAlignment: .center,
        children: [
          Image.asset("assets/images/cart.png", width: 200, height: 200),
          Text(
            "your cart is empety",
            textAlign: .center,

            style: Theme.of(
              context,
            ).primaryTextTheme.displayMedium?.copyWith(color: ColorsApp.text),
          ),
        ],
      ),
    );
  }
}
