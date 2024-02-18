import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';

part 'fetch_apartments_state.dart';

class FetchApartmentsCubit extends Cubit<FetchApartmentsState> {
  FetchApartmentsCubit(this.homeRepo) : super(FetchApartmentsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchApartments({required int pageNumber}) async {
    emit(FetchApartmentsLoading());

    var result = await homeRepo.fetchApartments(pageNumber: pageNumber);

    result.fold((faluire) {
      emit(FetchApartmentsFaluire(faluire.errMessage));
    }, (apartmentList) {
      emit(FetchApartmentsSuccess(apartmentList));
    });
  }
}
