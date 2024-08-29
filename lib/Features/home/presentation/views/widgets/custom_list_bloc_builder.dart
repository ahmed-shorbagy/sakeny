import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/home_view.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:sakeny/core/utils/App_router.dart';

class CutomListBlocBuilder extends StatelessWidget {
  const CutomListBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchApartmentsCubit, FetchApartmentsState>(
      bloc: BlocProvider.of<FetchApartmentsCubit>(context)
        ..fetchApartments(
            pageNumber: pageNumber, query: FetchApartmentsCubit.currentQuery),
      builder: (context, state) {
        if (state is FetchApartmentsSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index < FetchApartmentsCubit.apartments.length) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: CustomListViewItem(
                      onTaped: () {
                        GoRouter.of(context).push(
                            AppRouter.kAppartmentdetailsView,
                            extra: FetchApartmentsCubit.apartments[index]);
                      },
                      apartment: FetchApartmentsCubit.apartments[index],
                    ),
                  );
                } else {
                  return null;
                }
              },
              childCount: FetchApartmentsCubit.apartments.length,
            ),
          );
        } else if (state is FetchApartmentsLoading) {
          return const SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is FetchApartmentsFaluire) {
          return SliverFillRemaining(
            child: Center(
              child: Text(
                'Oops! Something went wrong.\n${state.errMessage}',
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        } else {
          return const SliverFillRemaining();
        }
      },
    );
  }
}
