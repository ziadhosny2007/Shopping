import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

class EmptyFav extends StatelessWidget {
  const EmptyFav({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 16,

        mainAxisAlignment: .center,
        children: [
          Icon(Icons.favorite_border, size: 120, color: Color(0xff2F2F2F)),
          SizedBox(
            width: 250,
            child: Text(
              "There are no products in your favourite list ",
              textAlign: .center,

              style: Theme.of(
                context,
              ).primaryTextTheme.displayMedium?.copyWith(color: ColorsApp.text),
            ),
          ),
        ],
      ),
    );
  }
}
