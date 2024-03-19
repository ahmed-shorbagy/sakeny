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
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.bed_sharp,
                    color: Colors.white,
                    size: 18,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  '${int.parse(apartment.numberOfDoubleBeds ?? '0') + int.parse(apartment.numberOfSingleBeds ?? '0') + int.parse(apartment.numberOfTripleBeds ?? '0')} ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
