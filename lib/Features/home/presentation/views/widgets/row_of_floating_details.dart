import 'package:flutter/material.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';

class RowOfFloatingDetails extends StatelessWidget {
  const RowOfFloatingDetails({
    super.key,
    required this.apartment,
  });

  final ApartmentModel apartment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  '${int.parse(apartment.numberOfDoubleBeds ?? '0') + int.parse(apartment.numberOfSingleBeds ?? '0') + int.parse(apartment.numberOfTripleBeds ?? '0')} ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                      fontWeight: FontWeight.bold),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bed_sharp,
                    color: Theme.of(context).colorScheme.outline,
                    size: 18,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
