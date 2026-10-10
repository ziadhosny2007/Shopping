import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.name,required this.slug});
  String name;
  String slug;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1),
      ),
      child: Text(name, style: Theme.of(context).primaryTextTheme.bodyMedium),
    );
  }
}
