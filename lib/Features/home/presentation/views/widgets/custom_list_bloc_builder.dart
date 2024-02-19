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
          apartments.addAll(state.apartmentsList);
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomListViewItem(
                    apartment: apartments[index],
                  ),
                );
              },
              childCount: apartments.length,
            ),
          );
        } else if (state is FetchApartmentsLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: CustomListViewItem(
                    apartment: apartments[index],
                  ),
                );
              },
              childCount: apartments.length,
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
