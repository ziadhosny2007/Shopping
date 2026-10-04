import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 164,
      height: 290,
      child: Card(
        elevation: 0,
        color: ColorsApp.backgroundColor,
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Container(
              color: Color(0xffFCFCFC),
              height: 240,
              child: Column(
                spacing: 2,
                children: [
                  Row(
                    mainAxisAlignment: .end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border,
                          color: Color(0xff5C5C5C),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/images/image.png",
                    width: 164,
                    height: 162,
                  ),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "T-shirt oversize",
                  style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                    color: Color(0xff000000),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Color(0xffFBC10D), size: 14),
                    Text("4.5"),
                  ],
                ),
              ],
            ),

            Row(
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
      ),
    );
  }
}
