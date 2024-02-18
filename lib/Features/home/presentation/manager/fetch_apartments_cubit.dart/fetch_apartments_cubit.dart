import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';

part 'fetch_apartments_state.dart';

class FetchApartmentsCubit extends Cubit<FetchApartmentsState> {
  FetchApartmentsCubit() : super(FetchApartmentsInitial());
}
