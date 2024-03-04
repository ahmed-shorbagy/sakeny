part of 'add_favorite_cubit.dart';

@immutable
sealed class AddFavoriteState {}

final class AddFavoriteInitial extends AddFavoriteState {}

final class AddFavoriteLoading extends AddFavoriteState {}

final class AddFavoriteSuccess extends AddFavoriteState {}

final class AddFavoriteFaluire extends AddFavoriteState {
  final String erMessage;

  AddFavoriteFaluire(this.erMessage);
}
