import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

// ignore: must_be_immutable
class PrimaryBtn extends StatelessWidget {
  PrimaryBtn({
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

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: .w600,
            color: Color(0xffffffff),
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
