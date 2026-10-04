import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xffffffff),
      alignment: .center,
      insetAnimationCurve: Curves.easeInSine,
      constraints: BoxConstraints(maxWidth: 300, maxHeight: 200),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(30),
      ),
      shadowColor: Colors.black.withAlpha(200),
      child: Center(
        child: LoadingAnimationWidget.discreteCircle(
          size: 50,
          color: Colors.blue,
        ),
      ),
    );
  }
}
