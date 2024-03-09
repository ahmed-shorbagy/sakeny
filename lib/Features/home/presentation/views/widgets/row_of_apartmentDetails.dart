import 'package:flutter/material.dart';
import 'package:sakeny/generated/l10n.dart';

class RowOfApartmentDetails extends StatelessWidget {
  const RowOfApartmentDetails({
    super.key,
    required this.title,
    required this.price,
    required this.numberofBeds,
  });
  final String title;
  final String numberofBeds;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(title, style: Theme.of(context).textTheme.bodyLarge)),
        Expanded(
          child: Text(
            numberofBeds,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Expanded(
          child: Text(
            '$price ${S.of(context).EGP}',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }
}
