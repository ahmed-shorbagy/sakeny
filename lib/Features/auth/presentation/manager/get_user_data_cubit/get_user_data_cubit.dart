import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/core/models/User_model.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit(this.authRepo) : super(GetUserDataInitial());

  final AuthRepo authRepo;
  Future<void> getUserData({required String uId}) async {
    emit(GetUserDataLoading());

    var responce = await authRepo.getUserData(uid: uId);
    responce.fold((faluire) {
      emit(GetUserDataFaluire(errMessage: faluire.errMessage));
    }, (user) {
      emit(GetUserDataSuccess(user: user));
    });
  }
}
