import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shimmer/shimmer.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 300,
      color: ColorsApp.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 238,
            width: 164,
            color: Color(0xffFCFCFC),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                CachedNetworkImage(
                  width: 164,
                  height: 164,
                  fit: BoxFit.cover,
                  imageUrl: product.images.first,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 140,
                      height: 125,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ],
            ),
          ),

          SizedBox(height: 6),

          Row(
            children: [
              Expanded(
                child: Text(
                  product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).primaryTextTheme.bodySmall?.copyWith(color: Colors.black),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.star, color: Color(0xffFBC10D), size: 14),
              Text(product.rating.toString()),
            ],
          ),

          SizedBox(height: 4),

          Row(
            children: [
              Text(
                '${product.price} EGP',
                style: Theme.of(context).primaryTextTheme.bodySmall,
              ),
              const SizedBox(width: 8),
              Text(
                '${product.discountPercentage}%',
                style: const TextStyle(color: Colors.amberAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
