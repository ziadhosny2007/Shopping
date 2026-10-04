import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BlackBtn extends StatelessWidget {
  BlackBtn({
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
        borderRadius: BorderRadius.circular(8),
        color: Color(0xff212121),
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
