import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:shopping/features/product_details/presentation/view/product_details.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});

  final ProductItemEntity product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProductDetails(id: product.id),
          ),
        );
      },

      child: Container(
        width: 164,
        height: 300,
        color: ColorsApp.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 238,
              width: 164,
              color: const Color(0xffFCFCFC),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BlocSelector<FavouriteCubit, FavouriteState, bool>(
                        selector: (state) {
                          if (state is FavouriteSuccess) {
                            final favourites = state.data;

                            return favourites.any(
                              (item) =>
                                  item.id.toString() == product.id.toString(),
                            );
                          }

                          return false;
                        },
                        builder: (context, isFavorite) {
                          return IconButton(
                            onPressed: () {
                              final cubit = context.read<FavouriteCubit>();

                              if (isFavorite) {
                                cubit.deleteFromFavourite(
                                  product.id.toString(),
                                );
                              } else {
                                cubit.addToFavorite(product.id.toString());
                              }
                            },
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : ColorsApp.text,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  CachedNetworkImage(
                    width: 164,
                    height: 164,
                    fit: BoxFit.cover,
                    imageUrl: product.images.first,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(color: Colors.amber),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Image.asset(
                        'assets/images/error.png',
                        width: 32,
                        height: 32,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: 150,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).primaryTextTheme.bodyMedium
                          ?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.star, color: Color(0xffFBC10D), size: 14),
                  Text(product.rating.toString()),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  '${product.price.floorToDouble()} EGP',
                  style: Theme.of(context).primaryTextTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  '${product.discountPercentage.floorToDouble()}%',
                  style: const TextStyle(color: Colors.amberAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
