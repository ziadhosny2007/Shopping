import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

class ItemCart extends StatelessWidget {
  const ItemCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 102,
      decoration: BoxDecoration(color: ColorsApp.secondary),
      child: Stack(
        children: [
          Positioned.fill(
            child: Row(
              mainAxisAlignment: .start,
              spacing: 8,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    "assets/images/onboarding1.png",
                    width: 110,
                  ),
                ),
                Column(
                  mainAxisAlignment: .spaceAround,
                  mainAxisSize: .max,
                  children: [
                    Text(
                      "T-shirt oversize",
                      style: Theme.of(context).primaryTextTheme.bodySmall
                          ?.copyWith(color: ColorsApp.text),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Text(
                          "EGP 199",
                          style: Theme.of(context).primaryTextTheme.bodySmall,
                        ),
                        Text("EGP 250"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            right: 10,
            child: Column(
              mainAxisAlignment: .spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
                SizedBox(height: 4),
                InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/icons/delete.png",
                    width: 34,
                    height: 34,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
