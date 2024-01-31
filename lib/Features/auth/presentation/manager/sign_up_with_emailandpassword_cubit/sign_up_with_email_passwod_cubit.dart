import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';

part 'sign_up_with_email_passwod_state.dart';

class SignUpWithEmailPasswodCubit extends Cubit<SignUpWithEmailPasswodState> {
  SignUpWithEmailPasswodCubit(this.authRepo)
      : super(SignUpWithEmailPasswodInitial());

  final AuthRepo authRepo;
  Future<void> signUpWithEmailPassword(
      {required String email, required String password}) async {
    emit(SignUpWithEmailPasswodLoading());
    final userCredential = await authRepo.createUserWithEmailAndPassword(
        email: email, password: password);
    userCredential.fold((faluire) {
      emit(SignUpWithEmailPasswodFaluire(faluire.errMessage));
    }, (success) {
      emit(SignUpWithEmailPasswodSuccess());
    });
  }
}
