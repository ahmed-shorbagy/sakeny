import 'package:flutter/material.dart';
import 'package:sakeny/Features/auth/presentation/views/widgets/custom_button.dart';

class RentalButtons extends StatelessWidget {
  const RentalButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
              onPressed: () {},
              child: Text('Rent a single',
                  style: Theme.of(context).textTheme.bodyLarge)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
              onPressed: () {},
              child: Text('Rent a Double',
                  style: Theme.of(context).textTheme.bodyLarge)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
              onPressed: () {},
              child: Text('Rent a Triple',
                  style: Theme.of(context).textTheme.bodyLarge)),
        ),
      ],
    );
  }
}
