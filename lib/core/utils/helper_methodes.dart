import 'package:flutter/material.dart';

void snackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Theme.of(context).colorScheme.secondary,
    behavior: SnackBarBehavior.floating,
    width: 200,
    shape: const StadiumBorder(),
    content: Center(child: Text(massage)),
    padding: const EdgeInsets.all(12),
    duration: const Duration(seconds: 2),
  ));
}
