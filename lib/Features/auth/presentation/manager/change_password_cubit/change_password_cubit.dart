import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  Future<void> sendPasswordReset({required email}) async {
    try {
      emit(ChangePasswordLoading());
      await auth.sendPasswordResetEmail(email: email);
      emit(ChangePasswordSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ChangePasswordFaluire(errMessage: e.code));
      log(e.code);
    }
  }
}
