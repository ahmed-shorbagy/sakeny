import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';

part 'add_favorite_state.dart';

class AddFavoriteCubit extends Cubit<AddFavoriteState> {
  AddFavoriteCubit(this.favoritesRepository) : super(AddFavoriteInitial());
  final FavoritesRepository favoritesRepository;

  Future<void> addApartmentToFavorites({required String apartmentId}) async {
    emit(AddFavoriteLoading());
    var result =
        await favoritesRepository.addToFavorites(apartmentId: apartmentId);
    result.fold((faluire) {
      emit(AddFavoriteFaluire(faluire.errMessage));
    }, (r) {
      emit(AddFavoriteSuccess());
    });
  }
}
