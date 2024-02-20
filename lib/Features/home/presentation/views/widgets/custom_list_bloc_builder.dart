import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_list_view_item.dart';

class CutomListBlocBuilder extends StatelessWidget {
  const CutomListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchApartmentsCubit, FetchApartmentsState>(
      bloc: BlocProvider.of<FetchApartmentsCubit>(context)
        ..fetchApartments(
            pageNumber: pageNumber, query: FetchApartmentsCubit.currentQuery),
      builder: (context, state) {
        if (state is FetchApartmentsSuccess) {
          print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaa');
          print(FetchApartmentsCubit.apartments);
          for (var apartment in FetchApartmentsCubit.apartments) {
            print('Building ID: ${apartment.buildingID}');
            print('Photos URLs: ${apartment.photosUrls}');
            print('Number of Single Beds: ${apartment.numberOfSingleBeds}');
            print('Number of Double Beds: ${apartment.numberOfDoubleBeds}');
            print('Number of Triple Beds: ${apartment.numberOfTripleBeds}');
            print(
                'Price of One Bed in Single Beds: ${apartment.priceOfOneBedInSingleBeds}');
            print(
                'Price of One Bed in Double Beds: ${apartment.priceOfOneBedInDoubleBeds}');
            print(
                'Price of One Bed in Triple Beds: ${apartment.priceOfOneBedInTripleBeds}');
            print('Is For Males: ${apartment.isForMales}');
            print('Time: ${apartment.time}');
            print('Owner Name: ${apartment.owenrName}');
            print('Owner Phone: ${apartment.ownerPhone}');
            print('Owner Description: ${apartment.owenrDescription}');
            print('User Description: ${apartment.userDescription}');
            print('Type: ${apartment.type}');
            print('\n');
          }
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < FetchApartmentsCubit.apartments.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: CustomListViewItem(
                      apartment: FetchApartmentsCubit.apartments[index],
                    ),
                  );
                } else {
                  return null; // Return null for indexes out of range
                }
              },
              childCount: FetchApartmentsCubit.apartments.length,
            ),
          );
        } else if (state is FetchApartmentsLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomListViewItem(
                    apartment: FetchApartmentsCubit.apartments[index],
                  ),
                );
              },
              childCount: FetchApartmentsCubit.apartments.length,
            ),
          );
        } else if (state is FetchApartmentsFaluire) {
          log(state.errMessage);
          return const SliverFillRemaining(
            child: Center(
              child: Text('Oops! Something went wrong.'),
            ),
          );
        } else {
          return const SliverFillRemaining(); // Placeholder for other states
        }
      },
    );
  }
}
