import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/Features/auth/data/repos/auth_repo.dart';
import 'package:sakeny/core/models/user_cubit/user_cubit_cubit.dart';

part 'delete_password_state.dart';

class DeletePasswordCubit extends Cubit<DeletePasswordState> {
  DeletePasswordCubit() : super(DeletePasswordInitial());

  Future<void> deleteAccount() async {
    try {
      emit(DeletePasswordLoading());

      // Reauthenticate the current user
      // Check the current user's provider data to determine the authentication method used
      for (UserInfo userInfo in auth.currentUser!.providerData) {
        if (userInfo.providerId == 'password') {
          // Reauthentication for email/password users
          AuthCredential credential = EmailAuthProvider.credential(
              email: UserCubit.user.email, password: 'password');
          await auth.currentUser!.reauthenticateWithCredential(credential);
        } else if (userInfo.providerId == 'google.com') {
          // Reauthentication for Google sign-in users
          GoogleSignIn googleSignIn = GoogleSignIn();
          GoogleSignInAccount? googleSignInAccount =
              await googleSignIn.signInSilently();
          GoogleSignInAuthentication googleAuth =
              await googleSignInAccount!.authentication;
          AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );
          await auth.currentUser!.reauthenticateWithCredential(credential);
        }
      }

      // Once the user is successfully reauthenticated, you can proceed with deleting the account
      await FirebaseFirestore.instance
          .collection('users')
          .doc(auth.currentUser?.uid)
          .delete();
      await auth.currentUser?.delete();

      emit(DeletePasswordSuccess());
    } on FirebaseException catch (e) {
      emit(DeletePasswordFaluire(errMessage: e.code));
    }
  }
}
