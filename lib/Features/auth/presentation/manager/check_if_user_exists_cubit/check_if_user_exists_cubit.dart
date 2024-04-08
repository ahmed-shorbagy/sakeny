import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';

part 'check_if_user_exists_state.dart';

class CheckIfUserExistsCubit extends Cubit<CheckIfUserExistsState> {
  CheckIfUserExistsCubit(this.authRepo) : super(CheckIfUserExistsInitial());
  final AuthRepo authRepo;

  Future<void> checkIfUserExists({required String uid}) async {
    emit(CheckIfUserExistsLoading());
    var responce = await authRepo.isUserInFirestore(uid: uid);
    responce.fold((faluire) {
      emit(CheckIfUserExistsFaluire());
    }, (value) {
      if (value) {
        emit(CheckIfUserExistsSuccess());
      } else {
        emit(CheckIfUserExistsFaluire());
      }
    });
  }
}
