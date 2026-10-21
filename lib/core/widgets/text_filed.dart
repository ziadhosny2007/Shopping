import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

// ignore: must_be_immutable
class TextFiledStyle extends StatelessWidget {
  TextFiledStyle({
    super.key,
    this.hint = "",
    required this.isSecure,
    this.controller,
    this.onChanged,
  });
  String hint;
  bool isSecure;
  TextEditingController? controller;
  bool click = false;
  Function(String value)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        obscureText: isSecure,
        decoration: InputDecoration(
          hint: Text(hint, style: Theme.of(context).primaryTextTheme.bodySmall),
          filled: true,
          fillColor: ColorsApp.backgroundColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xff636363)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorsApp.orangeDark),
          ),
          suffixIcon: (isSecure)
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    (click) ? Icons.visibility : Icons.visibility_off_outlined,
                  ),
                )
              : Text(""),
        ),
      ),
    );
  }
}
