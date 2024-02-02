import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';

part 'sign_in_email_password_state.dart';

class SignInEmailPasswordCubit extends Cubit<SignInEmailPasswordState> {
  SignInEmailPasswordCubit(this.authRepo) : super(SignInEmailPasswordInitial());
  final AuthRepo authRepo;
  Future<void> signInWithEmailPassword(
      {required String email, required String password}) async {
    emit(SignInEmailPasswordLoading());
    final userCredential = await authRepo.signInWithEmailPassword(
        email: email, password: password);
    userCredential.fold((faluire) {
      emit(SignInEmailPasswordFaluire(faluire.errMessage));
    }, (success) {
      emit(SignInEmailPasswordSuccess());
    });
  }
}
