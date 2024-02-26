import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/home/data/Models/request_model.dart';
import 'package:sakeny/Features/home/data/Repos/home_repo.dart';

part 'requests_state.dart';

class RequestsCubit extends Cubit<RequestsState> {
  RequestsCubit(this.homeRepo) : super(RequestsInitial());
  final HomeRepo homeRepo;

  Future<void> addNEwRequest({required RequestModel request}) async {
    emit(RequestsLoading());
    var result = await homeRepo.addNewRequestToFirestore(request: request);

    result.fold((faluire) {
      emit(RequestsFailure(faluire.errMessage));
    }, (success) {
      emit(RequestsSuccess());
    });
  }
}
