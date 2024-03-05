import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';

class AppartmentFilterButtons extends StatefulWidget {
  const AppartmentFilterButtons({
    super.key,
  });

  @override
  State<AppartmentFilterButtons> createState() =>
      _AppartmentFilterButtonsState();
}

bool isForMales = false;
bool isForFemales = false;
bool isSingle = true;
bool isDouble = true;
bool isTriple = true;

class _AppartmentFilterButtonsState extends State<AppartmentFilterButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStatePropertyAll<BorderSide>(
                    BorderSide(
                        color: isForMales
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.transparent,
                        width: 2),
                  ),
                ),
                onPressed: () async {
                  FetchApartmentsCubit.currentQuery = FirebaseFirestore.instance
                      .collection('Apartments')
                      .where('isForMales', isEqualTo: true)
                      .orderBy('time', descending: true);
                  setState(() {
                    isForMales = true;
                    isForFemales = false;
                  });
                  FetchApartmentsCubit.apartments.clear();

                  await BlocProvider.of<FetchApartmentsCubit>(context)
                      .fetchFilteredApartments(
                          pageNumber: 1,
                          isDouble: isDouble,
                          isForFemales: isForFemales,
                          isForMales: isForMales,
                          isSingle: isSingle,
                          isTriple: isTriple);
                },
                child: Text("Males only",
                    style: Theme.of(context).textTheme.bodyLarge!),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton(
                style: ButtonStyle(
                  side: MaterialStatePropertyAll<BorderSide>(
                    BorderSide(
                        color: isForFemales
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.transparent,
                        width: 2),
                  ),
                ),
                onPressed: () async {
                  FetchApartmentsCubit.currentQuery = FirebaseFirestore.instance
                      .collection('Apartments')
                      .where('isForMales', isEqualTo: false)
                      .orderBy('time', descending: true);
                  setState(() {
                    isForMales = false;
                    isForFemales = true;
                  });
                  FetchApartmentsCubit.apartments.clear();

                  await BlocProvider.of<FetchApartmentsCubit>(context)
                      .fetchFilteredApartments(
                          pageNumber: 1,
                          isDouble: isDouble,
                          isForFemales: isForFemales,
                          isForMales: isForMales,
                          isSingle: isSingle,
                          isTriple: isTriple);
                },
                child: Text("Females only",
                    style: Theme.of(context).textTheme.bodyLarge!),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
