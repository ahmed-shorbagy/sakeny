import 'package:flutter/material.dart';

class CustomUnderLineTextField extends StatelessWidget {
  const CustomUnderLineTextField({
    super.key,
    required this.label,
    this.suffixIcon,
    required this.onChanged,
  });
  final String label;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return ' This field is required';
        }
        return null;
      },
      onChanged: onChanged,
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
