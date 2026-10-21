import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

// ignore: must_be_immutable
class ItemCart extends StatelessWidget {
  ItemCart({
    super.key,
    required this.discount,
    required this.image,
    required this.price,
    required this.title,
  });
  String title;
  double price;
  double discount;
  String image;
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
                  child: CachedNetworkImage(
                    width: 110,
                    height: 110,
                    fit: BoxFit.cover,
                    imageUrl: image,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Image.asset(
                        "assets/images/error.png",
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: .spaceAround,
                  mainAxisSize: .max,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).primaryTextTheme.bodySmall
                          ?.copyWith(color: ColorsApp.text),
                    ),
                    Row(
                      spacing: 8,
                      children: [
                        Text(
                          "$price EGP",
                          style: Theme.of(context).primaryTextTheme.bodySmall,
                        ),
                        Text("$discount%"),
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
