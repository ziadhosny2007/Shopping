import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/model/widget/product_widget.dart';
import 'package:shopping/core/utils/massege_error.dart';
import 'package:shopping/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:shopping/features/search/domain/entities/search_entity.dart';
import 'package:shopping/features/search/presentation/view_model/search_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearshScreen extends StatefulWidget {
  const SearshScreen({super.key});

  @override
  State<SearshScreen> createState() => _SearshScreenState();
}

class _SearshScreenState extends State<SearshScreen> {
  final TextEditingController controller = TextEditingController();

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();

    if (value.trim().isEmpty) {
      context.read<SearchCubit>().clearSearch();
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (!mounted) return;

      context.read<SearchCubit>().search(value.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                hintText: 'Search products...',
                hintStyle: Theme.of(context).primaryTextTheme.bodySmall,
                prefixIcon: const Icon(Icons.search, size: 30),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.clear();
                    _onSearchChanged('');
                  },
                  icon: const Icon(Icons.close),
                ),
                filled: true,
                fillColor: ColorsApp.backgroundColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xff636363)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: ColorsApp.orangeDark),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchInitial) {
                    return Center(child: Text('Search for a product'));
                  }

                  if (state is SearchLoading) {
                    return _LoadingWidget();
                  }

                  if (state is SearchError) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: SvgPicture.asset(
                          "assets/svg/loading.svg",
                          width: 200,
                          height: 200,
                        ),
                      ),
                    );
                  }

                  if (state is SearchSuccess) {
                    final List<SearchItemEntity> items = state.data;

                    if (items.isEmpty) {
                      return Center(child: Text('No products found'));
                    }

                    return _SuccessWidget(items: items);
                  }

                  return SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({required this.items});

  final List<SearchItemEntity> items;

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

        return BlocListener<FavouriteCubit, FavouriteState>(
          listener: (context, state) {
            if (state is FavouriteError) {
               MassegeError.show(context, error: state.error);

            }
          },
          child: ProductWidget(
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
        );
      },
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Color(0xFFE8E8E8),
        highlightColor: Color(0xFFF8F8F8),
        duration: Duration(milliseconds: 1200),
      ),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 10, right: 16),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisExtent: 300,
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, i) {
          return ProductWidget(
            product: ProductItemEntity(
              id: i,
              title: 'Product Name',
              description: 'Product Description',
              price: 888,
              discountPercentage: 8,
              rating: 4,
              images: const ['image'],
            ),
          );
        },
      ),
    );
  }
}
