import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';

part 'remove_favorite_state.dart';

class RemoveFavoriteCubit extends Cubit<RemoveFavoriteState> {
  RemoveFavoriteCubit(this.favoritesRepository)
      : super(RemoveFavoriteInitial());
  final FavoritesRepository favoritesRepository;
  Future<void> removeApartmentFromFavorites(
      {required String apartmentId}) async {
    emit(RemoveFavoriteLoading());
    var result =
        await favoritesRepository.removeFromFavorites(apartmentId: apartmentId);
    result.fold((faluire) {
      emit(RemoveFavoriteFaluire(faluire.errMessage));
    }, (r) {
      emit(RemoveFavoriteSuccess());
    });
  }
}
