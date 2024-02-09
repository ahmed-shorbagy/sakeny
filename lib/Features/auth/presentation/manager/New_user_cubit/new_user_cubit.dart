import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/core/models/User_model.dart';

part 'new_user_state.dart';

class NewUserCubit extends Cubit<NewUserState> {
  NewUserCubit(this.authRepo) : super(NewUserInitial());
  final AuthRepo authRepo;
  Future<void> addUserToFireStore(
      {required UserModel user, required String uid}) async {
    final responce = await authRepo.addNewUserToFireStore(user: user, uid: uid);
    responce.fold((faluire) {
      emit(NewUserFaluire(faluire.errMessage));
    }, (success) {
      emit(NewUserSuccess());
    });
  }
}
