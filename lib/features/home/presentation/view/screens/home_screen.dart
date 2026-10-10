import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/model/widget/product_widget.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'package:shopping/features/home/presentation/view/widgets/category_item.dart';
import 'package:shopping/features/home/presentation/view_model/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator<HomeCubit>()..intent(GetCallBoth()),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
      context.read<HomeCubit>().getAllProducts();
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 4,
            children: [
              Text(
                "Hi !,",
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Let’s start your day",
                style: Theme.of(context).primaryTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeCubit, HomeState>(
                buildWhen: (previous, current) =>
                    current is CategoryLoading ||
                    current is CategorySuccess ||
                    current is CategoryError,
                builder: (context, state) {
                  if (state is CategorySuccess) {
                    return SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return CategoryItem(
                            name: state.categories[index].name,
                            slug: state.categories[index].slug,
                          );
                        },
                      ),
                    );
                  }
                  if (state is CategoryError) {
                    return Center(
                      child: Text(
                        state.error,
                        style: Theme.of(context).primaryTextTheme.bodyLarge
                            ?.copyWith(color: Colors.red),
                      ),
                    );
                  }
                  return SizedBox(
                    height: 40,
                    child: Skeletonizer(
                      enabled: true,
                      effect: ShimmerEffect.raw(
                        colors: [Color.fromARGB(0, 255, 255, 255)],
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return CategoryItem(name: "name", slug: "slug");
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is StateLoading ||
                      current is StateSuccess ||
                      current is StateError,
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
                          style: Theme.of(context).primaryTextTheme.bodyLarge
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

  final List<ItemEntity> items;
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
