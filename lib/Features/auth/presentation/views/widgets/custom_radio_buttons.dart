import 'package:flutter/material.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';

class CustomRadioButtons extends StatefulWidget {
  const CustomRadioButtons({
    super.key,
  });

  @override
  State<CustomRadioButtons> createState() => _CustomRadioButtonsState();
}

final List<String> options = ['male', 'female'];

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
            secondary: const Text(
              '♂️',
              style: TextStyle(fontSize: 32),
            ),
            overlayColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.outline),
            hoverColor: Theme.of(context).colorScheme.outline,
            fillColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.secondary),
            enableFeedback: true,
            activeColor: Colors.black,
            title: const Text('Male'),
            value: options[0],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = options[0];
              });
              UserCubit.user.isMail = true;
            }),
        RadioListTile(
            secondary: const Text(
              '♀️',
              style: TextStyle(fontSize: 32),
            ),
            hoverColor: Theme.of(context).colorScheme.secondary,
            fillColor: MaterialStatePropertyAll<Color>(
                Theme.of(context).colorScheme.secondary),
            enableFeedback: true,
            activeColor: Colors.black,
            title: const Text('Female'),
            value: options[1],
            groupValue: currentOption,
            onChanged: (value) {
              setState(() {
                currentOption = options[1];
              });
              UserCubit.user.isMail = false;
            }),
      ],
    );
  }
}
