import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/Features/favorites/peresentation/manager/fetch_favorites/fetch_favorites_cubit.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/Custom_app_bar.dart';
import 'package:sakeny/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:sakeny/core/utils/App_router.dart';
import 'package:sakeny/generated/l10n.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(title: S.of(context).bottomBarFavourite),
      ),
      body: BlocBuilder<FetchFavoritesCubit, FetchFavoritesState>(
        bloc: BlocProvider.of<FetchFavoritesCubit>(context)
          ..fetchFavorites(userId: auth.currentUser?.uid ?? ''),
        builder: (context, state) {
          if (state is FetchFavoritesSuccess) {
            if (state.apartmentsList.isEmpty) {
              return Center(
                child: Text(S.of(context).noFavorietsYet),
              );
            } else {
              return ListView.builder(
                itemCount: state.apartmentsList.length,
                itemBuilder: (context, index) {
                  return CustomListViewItem(
                    apartment: state.apartmentsList[index],
                    onTaped: () {
                      GoRouter.of(context).push(
                          AppRouter.kAppartmentdetailsView,
                          extra: state.apartmentsList[index]);
                    },
                  );
                },
              );
            }
          } else if (state is FetchFavoritesFaluire) {
            return Center(
              child: Text(state.erMessage),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
