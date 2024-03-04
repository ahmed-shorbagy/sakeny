import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/favorites/data/Repos/favorites_repo.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';

part 'fetch_favorites_state.dart';

class FetchFavoritesCubit extends Cubit<FetchFavoritesState> {
  FetchFavoritesCubit(this.favoritesRepository)
      : super(FetchFavoritesInitial());
  final FavoritesRepository favoritesRepository;
  Future<void> fetchFavorites({required String userId}) async {
    emit(FetchFavoritesLoading());
    var result =
        await favoritesRepository.getFavoriteApartments(userId: userId);
    result.fold((faluire) {
      emit(FetchFavoritesFaluire(faluire.errMessage));
    }, (apartmentList) {
      emit(FetchFavoritesSuccess(apartmentList));
    });
  }
}
