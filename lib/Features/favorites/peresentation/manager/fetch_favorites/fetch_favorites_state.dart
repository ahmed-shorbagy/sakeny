part of 'fetch_favorites_cubit.dart';

@immutable
sealed class FetchFavoritesState {}

final class FetchFavoritesInitial extends FetchFavoritesState {}

final class FetchFavoritesLoading extends FetchFavoritesState {}

final class FetchFavoritesSuccess extends FetchFavoritesState {
  final List<ApartmentModel> apartmentsList;

  FetchFavoritesSuccess(this.apartmentsList);
}

final class FetchFavoritesFaluire extends FetchFavoritesState {
  final String erMessage;

  FetchFavoritesFaluire(this.erMessage);
}
