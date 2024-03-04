part of 'remove_favorite_cubit.dart';

@immutable
sealed class RemoveFavoriteState {}

final class RemoveFavoriteInitial extends RemoveFavoriteState {}

final class RemoveFavoriteLoading extends RemoveFavoriteState {}

final class RemoveFavoriteSuccess extends RemoveFavoriteState {}

final class RemoveFavoriteFaluire extends RemoveFavoriteState {
  final String erMessage;

  RemoveFavoriteFaluire(this.erMessage);
}
