import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';

class AppartmentTypeButtons extends StatefulWidget {
  const AppartmentTypeButtons({
    super.key,
  });

  @override
  State<AppartmentTypeButtons> createState() => _AppartmentTypeButtonsState();
}

bool isForMales = false;
bool isForFemales = false;

class _AppartmentTypeButtonsState extends State<AppartmentTypeButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
              apartments.clear();

              await BlocProvider.of<FetchApartmentsCubit>(context)
                  .fetchApartments(
                      pageNumber: 1, query: FetchApartmentsCubit.currentQuery);
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
              apartments.clear();

              await BlocProvider.of<FetchApartmentsCubit>(context)
                  .fetchApartments(
                      pageNumber: 1, query: FetchApartmentsCubit.currentQuery);
            },
            child: Text("Females only",
                style: Theme.of(context).textTheme.bodyLarge!),
          ),
        ),
      ],
    );
  }
}
