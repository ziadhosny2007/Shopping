import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

// ignore: must_be_immutable
class SecoundaryBtn extends StatelessWidget {
  SecoundaryBtn({
    super.key,
    this.height = 48,
    required this.text,
    this.width = 350,
    required this.onPressed,
  });

  String text;
  double height;
  double width;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: .center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorsApp.lightGrey,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorsApp.orangeLight, width: 2),
      ),
      child: MaterialButton(
        minWidth: .infinity,
        height: .infinity,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: .w600,
            color: ColorsApp.orangeLight,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
