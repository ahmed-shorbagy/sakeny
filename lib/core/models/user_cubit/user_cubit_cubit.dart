import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:sakeny/core/models/User_model.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserState> {
  static UserModel user = UserModel(
      email: FirebaseAuth.instance.currentUser?.email ?? '',
      name: FirebaseAuth.instance.currentUser?.displayName ?? '',
      photoUrl: FirebaseAuth.instance.currentUser?.photoURL ?? '');
  UserCubit() : super(UserInitial());
}
