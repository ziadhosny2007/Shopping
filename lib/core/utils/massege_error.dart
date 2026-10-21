
import 'package:flutter/material.dart';

class MassegeError {
  static void show(
    BuildContext context, {
    required String error,
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
          showCloseIcon: true,
          content: Text(
            error,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
  }
}
