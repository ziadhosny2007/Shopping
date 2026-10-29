import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/features/cart/presentation/view/widgets/empty_cart.dart';
import 'package:shopping/features/cart/presentation/view/widgets/item_cart.dart';
import 'package:shopping/features/cart/presentation/view_model/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Favourite")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: BlocProvider(
          create: (context) =>
              serviceLocator<CartCubit>()..getProductFromCart(),
          child: BlocConsumer<CartCubit, CartState>(
            listenWhen: (previous, current) => current is CartError,
            listener: (context, state) {
              if (state is CartError) {
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
              if (state is CartLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.amberAccent),
                );
              }

              if (state is CartError) {
                return Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.asset(
                      "assets/images/error.gif",
                      width: 200,
                      height: 200,
                    ),
                  ),
                );
              }

              if (state is CartSuccess) {
                final List<ProductItemEntity> items = state.data;
                const double shippingFee = 45;

                final double subtotal = items.fold<double>(
                  0,
                  (sum, item) => sum + item.price,
                );

                if (items.isEmpty) {
                  return const EmptyCart();
                }

                return Column(
                  spacing: 12,
                  children: [
                    Expanded(flex: 5, child: _SuccessWidget(items: items)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Shipping Fee",
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        Text("$shippingFee EGP"),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub total",
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        Text("$subtotal EGP"),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context).primaryTextTheme.bodyMedium,
                        ),
                        Text("${subtotal + shippingFee} EGP"),
                      ],
                    ),
                  ],
                );
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
    return GridView.builder(
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

        return ItemCart(
          discount: item.discountPercentage,
          image: item.images.first,
          price: item.price,
          title: item.title,
        );
      },
    );
  }
}
