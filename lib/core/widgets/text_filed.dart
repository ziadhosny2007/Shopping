import 'package:flutter/material.dart';
import 'package:shopping/core/Themes/colors_app.dart';

// ignore: must_be_immutable
class TextFiledStyle extends StatefulWidget {
  TextFiledStyle({
    super.key,
    this.hint = "",
    required this.isSecure,
    this.controller,
  });
  String hint;
  bool isSecure;
  TextEditingController? controller;

  @override
  State<TextFiledStyle> createState() => _TextFiledStyleState();
}

class _TextFiledStyleState extends State<TextFiledStyle> {
  bool click = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isSecure,
        decoration: InputDecoration(
          hint: Text(
            widget.hint,
            style: Theme.of(context).primaryTextTheme.bodySmall,
          ),
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
          suffixIcon: (widget.isSecure)
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      widget.isSecure = !widget.isSecure;
                    });
                  },
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
