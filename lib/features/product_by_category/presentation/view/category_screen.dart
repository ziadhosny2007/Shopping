import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/model/widget/product_widget.dart';
import 'package:shopping/features/product_by_category/domain/entities/product_by_category_entity.dart';
import 'package:shopping/features/product_by_category/presentation/view_model/product_by_category_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

// ignore: must_be_immutable
class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.name, required this.slug});
  String name;
  String slug;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          serviceLocator<ProductByCategoryCubit>()
            ..intent(GetProductByCategories(), slug),
      child: CategoryScreenView(name: name, slug: slug),
    );
  }
}

// ignore: must_be_immutable
class CategoryScreenView extends StatefulWidget {
  CategoryScreenView({super.key, required this.name, required this.slug});
  String name;
  String slug;

  @override
  State<CategoryScreenView> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreenView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<ProductByCategoryCubit>().getProductByCategory(widget.slug);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;

    final position = _scrollController.position;

    return position.pixels >= position.maxScrollExtent - 200;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .center,

            children: [
              Expanded(
                child:
                    BlocBuilder<ProductByCategoryCubit, ProductByCategoryState>(
                      builder: (context, state) {
                        if (state is StateLoading) {
                          return const _LoadingWidget();
                        }

                        if (state is StateSuccess) {
                          return _SuccessWidget(
                            items: state.data,
                            scrollController: _scrollController,
                          );
                        }

                        if (state is StateError) {
                          return Center(
                            child: Text(
                              state.error,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.red),
                            ),
                          );
                        }

                        return const _LoadingWidget();
                      },
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuccessWidget extends StatelessWidget {
  const _SuccessWidget({required this.items, required this.scrollController});

  final List<ItemsEntity> items;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
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

        return ProductWidget(
          product: ProductItemEntity(
            id: item.id,
            title: item.title,
            description: item.description,
            price: item.price,
            discountPercentage: item.discountPercentage,
            rating: item.rating,
            images: item.images,
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
        baseColor: const Color(0xFFE8E8E8),
        highlightColor: const Color(0xFFF8F8F8),
        duration: const Duration(milliseconds: 1200),
      ),
      child: GridView.builder(
        padding: EdgeInsets.only(top: 10, right: 16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
