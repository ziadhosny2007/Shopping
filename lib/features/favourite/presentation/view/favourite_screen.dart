import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/model/widget/product_widget.dart';
import 'package:shopping/core/utils/massege_error.dart';
import 'package:shopping/features/favourite/presentation/view/empt_fav.dart';
import 'package:shopping/features/favourite/presentation/view_model/favourite_cubit.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Favourite")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: BlocProvider(
          create: (context) =>
              serviceLocator<FavouriteCubit>()..getProductFromFavourite(),
          child: BlocConsumer<FavouriteCubit, FavouriteState>(
            listenWhen: (previous, current) => current is FavouriteError,
            listener: (context, state) {
              if (state is FavouriteError) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 3),
                      showCloseIcon: true,
                      content: Text(
                        state.error,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      backgroundColor: Colors.red,
                      elevation: 2,
                    ),
                  );
              }
            },
            builder: (context, state) {
              if (state is FavouriteLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.amberAccent),
                );
              }

              if (state is FavouriteError) {
                return Center(
                  child: SvgPicture.asset(
                    "assets/svg/error.svg",
                    width: 200,
                    height: 200,
                  ),
                );
              }

              if (state is FavouriteSuccess) {
                final items = state.data;

                if (items.isEmpty) {
                  return EmptyFav();
                }

                return _SuccessWidget(items: items);
              }

              return Center(
                child: SvgPicture.asset(
                  "assets/svg/loading.svg",
                  width: 200,
                  height: 200,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({required this.items});

  final List<ProductItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteError) {
          MassegeError.show(context, error: state.error);
        }
      },
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10, right: 16, bottom: 20),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 300,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        itemCount: items.length,
        itemBuilder: (context, i) {
          final item = items[i];

          return Column(
            spacing: 10,
            children: [
              ProductWidget(
                product: ProductItemEntity(
                  id: item.id,
                  title: item.title,
                  description: item.description,
                  price: item.price,
                  discountPercentage: item.discountPercentage,
                  rating: item.rating,
                  images: item.images,
                ),
              ),
              Container(
                alignment: .center,
                height: 48,
                width: 104,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 8,
                      spreadRadius: 0,
                      color: Color(0xffFF9900),
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: [ColorsApp.orangeDark, ColorsApp.orangeLight],
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: MaterialButton(
                  minWidth: .infinity,
                  height: .infinity,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(
                      fontWeight: .w600,
                      color: Color(0xffffffff),
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
