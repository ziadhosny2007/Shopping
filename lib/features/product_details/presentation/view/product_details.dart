import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopping/core/Themes/colors_app.dart';
import 'package:shopping/core/di/service_locator.dart';
import 'package:shopping/core/widgets/Buttons/black_btn.dart';
import 'package:shopping/features/product_details/presentation/view_model/product_details_cubit.dart';

// ignore: must_be_immutable
class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.id});
  int id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          serviceLocator<ProductDetailsCubit>()
            ..intent(GetProductDetails(), id),

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
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: SvgPicture.asset(
                        "assets/svg/error.svg",
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is ProductDetailsSuccess) {
              var item = state.data;
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
                                imageUrl: item.images.first,
                                width: 264,
                                height: 260,
                                fit: BoxFit.cover,
                                progressIndicatorBuilder:
                                    (context, url, progress) => Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.amberAccent,
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    Image.asset(
                                      "assets/images/error.png",
                                      width: 120,
                                      height: 120,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: .spaceAround,
                        children: [
                          Text(
                            item.title,
                            style: Theme.of(
                              context,
                            ).primaryTextTheme.bodyMedium,
                          ),
                          Row(
                            spacing: 4,
                            children: [
                              Text(
                                "${item.price.floorToDouble()} EGP",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall
                                    ?.copyWith(color: ColorsApp.text),
                              ),
                              Text(
                                " ${item.discountPercentage.floorToDouble()}%",
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .bodySmall
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
                          style: Theme.of(context).primaryTextTheme.bodySmall
                              ?.copyWith(
                                color: ColorsApp.text,
                                fontWeight: .w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Center(
                          child: BlackBtn(
                            text: "Add to cart",
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: SvgPicture.asset(
                  "assets/svg/loading.svg",
                  width: 200,
                  height: 200,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
