import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/home/data/Models/apartment_model.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';

part 'fetch_apartments_state.dart';

class FetchApartmentsCubit extends Cubit<FetchApartmentsState> {
  static Query currentQuery = FirebaseFirestore.instance
      .collection('Apartments')
      .orderBy('time', descending: true);
  static List<ApartmentModel> apartments = [];
  FetchApartmentsCubit(this.homeRepo) : super(FetchApartmentsInitial());

  final HomeRepo homeRepo;

  Future<void> fetchApartments(
      {required int pageNumber, required Query query}) async {
    emit(FetchApartmentsLoading());

    var result =
        await homeRepo.fetchApartments(pageNumber: pageNumber, query: query);

    result.fold((faluire) {
      emit(FetchApartmentsFaluire(faluire.errMessage));
    }, (apartmentList) {
      apartments.addAll(apartmentList);
      emit(FetchApartmentsSuccess(apartmentList));
    });
  }

  Future<void> fetchFilteredApartments({
    required int pageNumber,
    required bool isSingle,
    required bool isDouble,
    required bool isTriple,
    required bool isForMales,
    required bool isForFemales,
  }) async {
    apartments.clear();
    emit(FetchApartmentsLoading());

    // Start with the base query
    Query query = FirebaseFirestore.instance.collection('Apartments');

    // Apply filters based on selected options
    List<String> types = [];
    if (isSingle) types.add('single');
    if (isDouble) types.add('double');
    if (isTriple) types.add('triple');
    log(types.toString());
    // If no bed type is selected, show all types
    if (types.isNotEmpty) {
      query = query.where('type', arrayContainsAny: types);
    }

    // Apply gender preference filter
    if (isForMales) {
      query = query.where('isForMales', isEqualTo: true);
    } else if (isForFemales) {
      query = query.where('isForMales', isEqualTo: false);
    }

    // Execute the query
    var result =
        await homeRepo.fetchApartments(pageNumber: pageNumber, query: query);

    result.fold(
      (failure) {
        emit(FetchApartmentsFaluire(failure.errMessage));
      },
      (apartmentList) {
        apartments.addAll(apartmentList);
        emit(FetchApartmentsSuccess(apartmentList));
      },
    );
  }
}
