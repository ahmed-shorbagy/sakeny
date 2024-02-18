part of 'fetch_apartments_cubit.dart';

@immutable
sealed class FetchApartmentsState {}

final class FetchApartmentsInitial extends FetchApartmentsState {}

final class FetchApartmentsLoading extends FetchApartmentsState {}

final class FetchApartmentsFaluire extends FetchApartmentsState {
  final String errMessage;

  FetchApartmentsFaluire(this.errMessage);
}

final class FetchApartmentsSuccess extends FetchApartmentsState {
  final List<ApartmentModel> apartmentsList;

  FetchApartmentsSuccess(this.apartmentsList);
}
