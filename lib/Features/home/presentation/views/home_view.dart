import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/presentation/manager/fetch_apartments_cubit.dart/fetch_apartments_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_apartment_type_buttons.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_bottom_bar.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_sliver_app_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int pageNumber = 1;
List<ApartmentModel> apartments = [];

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    // Check if the user has reached the end of the scroll view
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // User has reached the end, increment the pageNumber
      setState(() {
        pageNumber++;
      });
      log(pageNumber.toString());
      // Fetch new data based on the incremented pageNumber
      BlocProvider.of<FetchApartmentsCubit>(context)
          .fetchApartments(pageNumber: pageNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const CustomSliverAppBar(),
          const SliverToBoxAdapter(
            child: AppartmentTypeButtons(),
          ),
          BlocBuilder<FetchApartmentsCubit, FetchApartmentsState>(
            bloc: BlocProvider.of<FetchApartmentsCubit>(context)
              ..fetchApartments(pageNumber: pageNumber),
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
                return const SliverFillRemaining(
                  child: Center(
                    child: Text('Oops! Something went wrong.'),
                  ),
                );
              } else {
                return const SliverFillRemaining(); // Placeholder for other states
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
