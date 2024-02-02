import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit(this.authRepo) : super(GoogleSignInInitial());
  final AuthRepo authRepo;
  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    final userCedential = await authRepo.signInWithGoogle();
    userCedential.fold((faluire) {
      emit(GoogleSignInFaluire(faluire.errMessage));
    }, (right) {
      emit(GoogleSignInSuccess());
    });
  }
}
