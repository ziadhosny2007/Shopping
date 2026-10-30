import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/model/item/product_item_entity.dart';
import 'package:shopping/core/model/widget/product_widget.dart';
import 'package:shopping/core/utils/massege_error.dart';
import 'package:shopping/features/favourite/presentation/view_model/favourite_cubit.dart';
import 'package:shopping/features/home/domain/entities/item_entity.dart';
import 'package:shopping/features/home/presentation/view/widgets/category_item.dart';
import 'package:shopping/features/home/presentation/view_model/home_cubit.dart';
import 'package:shopping/features/product_by_category/presentation/view/category_screen.dart';
import 'package:shopping/features/search/presentation/view/searsh_screen.dart';
import 'package:shopping/features/search/presentation/view_model/search_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<HomeCubit>()..intent(GetCallBoth()),
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
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Let’s start your day",
                    style: Theme.of(context).primaryTextTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                    serviceLocator<SearchCubit>(),
                              ),
                              BlocProvider(
                                create: (context) =>
                                    serviceLocator<FavouriteCubit>(),
                              ),
                            ],
                            child: SearshScreen(),
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.search),
                    iconSize: 24,
                  ),
                ],
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
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                    create: (context) =>
                                        serviceLocator<FavouriteCubit>(),
                                    child: CategoryScreen(
                                      name: state.categories[index].name,
                                      slug: state.categories[index].slug,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: CategoryItem(
                              name: state.categories[index].name,
                              slug: state.categories[index].slug,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  if (state is CategoryError) {
                    return Center(child: SizedBox.shrink());
                  }
                  return SizedBox(
                    height: 40,
                    child: Skeletonizer(
                      enabled: true,
                      effect: ShimmerEffect(
                        baseColor: Color(0xFFE8E8E8),
                        highlightColor: Color(0xFFF8F8F8),
                        duration: Duration(milliseconds: 1200),
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
                child: BlocConsumer<HomeCubit, HomeState>(
                  listenWhen: (previous, current) => current is StateError,
                  listener: (context, state) {
                    if (state is StateError) {
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/error.gif",
                              width: 200,
                              height: 200,
                            ),
                            const SizedBox(height: 12),
                            Text(state.error, textAlign: TextAlign.center),
                          ],
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
    return BlocListener<FavouriteCubit, FavouriteState>(
      listener: (context, state) {
        if (state is FavouriteError) {
          MassegeError.show(context, error: state.error);
        }
      },
      child: GridView.builder(
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
          ).fadeIn(delay: Duration(milliseconds: 20) ).shakeY();
        },
      )
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
