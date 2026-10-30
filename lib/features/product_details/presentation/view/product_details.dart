import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/utils/massege_error.dart';
import 'package:shopping/core/widgets/Buttons/black_btn.dart';
import 'package:shopping/features/cart/presentation/view_model/cart_cubit.dart';
import 'package:shopping/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:shopping/features/product_details/domain/entities/product_details_entity.dart';
import 'package:shopping/features/product_details/presentation/view_model/product_details_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.id});
  int id;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator<ProductDetailsCubit>()
                ..intent(GetProductDetails(), id),
        ),
        BlocProvider(create: (context) => serviceLocator<CartCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if (state is ProductDetailsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 3),
                  showCloseIcon: true,
                  content: Text(
                    state.error,
                    style: TextStyle(fontWeight: .w400, fontSize: 16),
                  ),
                  backgroundColor: Colors.red,
                  elevation: 2,
                ),
              );
              return Center(
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  spacing: 12,
                  children: [
                    Image.asset(
                      "assets/images/error.gif",
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              );
            }

            if (state is ProductDetailsSuccess) {
              var item = state.data;
              return DetailsSuccess(item: item);
            } else {
              return DetailsLoading(id: id);
            }
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailsSuccess extends StatelessWidget {
  DetailsSuccess({super.key, required this.item});

  final ProductDetailsEntity item;
  bool click = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .center,

          spacing: 8,
          children: [
            Center(
              child: Container(
                height: 332,

                width: 345,
                margin: EdgeInsets.only(bottom: 10),
                alignment: .center,
                decoration: BoxDecoration(
                  color: Color(0xffFCFCFC),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .center,
                  spacing: 12,
                  children: [
                    Row(
                      mainAxisAlignment: .end,
                      children: [
                        BlocListener<FavouriteCubit, FavouriteState>(
                          listener: (context, state) {
                            if (state is FavouriteError) {
                              MassegeError.show(context, error: state.error);
                            }
                          },
                          child:
                              BlocSelector<
                                FavouriteCubit,
                                FavouriteState,
                                bool
                              >(
                                selector: (state) {
                                  if (state is FavouriteSuccess) {
                                    final favourites = state.data;

                                    return favourites.any(
                                      (fav) =>
                                          fav.id.toString() ==
                                          item.id.toString(),
                                    );
                                  }

                                  return false;
                                },
                                builder: (context, isFavorite) {
                                  return IconButton(
                                    onPressed: () {
                                      final cubit = context
                                          .read<FavouriteCubit>();

                                      if (isFavorite) {
                                        cubit.deleteFromFavourite(
                                          item.id.toString(),
                                        );
                                      } else {
                                        cubit.addToFavorite(item.id.toString());
                                      }
                                    },
                                    icon: Icon(
                                      isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isFavorite
                                          ? Colors.red
                                          : ColorsApp.text,
                                    ),
                                  );
                                },
                              ),
                        ),
                      ],
                    ),
                    Hero(
                      tag: item.id,
                      child: CachedNetworkImage(
                        imageUrl: item.images.first,
                        width: 264,
                        height: 260,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) =>
                            Center(
                              child: CircularProgressIndicator(
                                color: Colors.amberAccent,
                              ),
                            ),
                        errorWidget: (context, url, error) => Image.asset(
                          "assets/images/error.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                Expanded(
                  child: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                ),
                Row(
                  spacing: 4,
                  children: [
                    Text(
                      "${item.price.floorToDouble()} EGP",
                      style: Theme.of(context).primaryTextTheme.bodySmall
                          ?.copyWith(color: ColorsApp.text),
                    ),
                    Text(
                      " ${item.discountPercentage.floorToDouble()}%",
                      style: Theme.of(context).primaryTextTheme.bodySmall
                          ?.copyWith(color: Colors.amberAccent),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 300,
              child: Text(
                item.description,
                style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                  color: ColorsApp.text,
                  fontWeight: .w500,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Center(
                child: BlocListener<CartCubit, CartState>(
                  listener: (context, state) {
                    if (state is CartError) {
                      MassegeError.show(context, error: state.error);
                    }
                  },
                  child: BlackBtn(
                    text: "Add to cart",
                    onPressed: () {
                      context.read<CartCubit>().addToCart(item.id.toString());
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsLoading extends StatelessWidget {
  const DetailsLoading({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Color(0xFFE8E8E8),
        highlightColor: Color(0xFFF8F8F8),
        duration: Duration(milliseconds: 1200),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .center,

            spacing: 8,
            children: [
              Center(
                child: Container(
                  height: 332,

                  width: 345,
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: Color(0xffFCFCFC),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: .start,
                    crossAxisAlignment: .center,
                    spacing: 12,
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
                      Hero(tag: id, child: const Bone.square(size: 260)),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: .spaceAround,
                children: [
                  Text(
                    "",
                    style: Theme.of(context).primaryTextTheme.bodyMedium,
                  ),
                  Row(
                    spacing: 4,
                    children: [
                      Text(
                        "",
                        style: Theme.of(context).primaryTextTheme.bodySmall
                            ?.copyWith(color: ColorsApp.text),
                      ),
                      Text(
                        "",
                        style: Theme.of(context).primaryTextTheme.bodySmall
                            ?.copyWith(color: Colors.amberAccent),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                width: 300,
                child: Text(
                  "",
                  style: Theme.of(context).primaryTextTheme.bodySmall?.copyWith(
                    color: ColorsApp.text,
                    fontWeight: .w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: BlackBtn(text: "Add to cart", onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
