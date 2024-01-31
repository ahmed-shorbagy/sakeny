import 'package:flutter/material.dart';

class CustomUnderLineTextField extends StatelessWidget {
  const CustomUnderLineTextField({
    super.key,
    required this.label,
    this.suffixIcon,
  });
  final String label;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).colorScheme.outline,
      decoration: InputDecoration(
          suffix: suffixIcon,
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          )),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            width: 1.5,
            color: Theme.of(context).colorScheme.outline,
          )),
          focusColor: Theme.of(context).colorScheme.secondary,
          label: Text(label),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.outline,
          )),
    );
  }
}
