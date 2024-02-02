import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  User user = FirebaseAuth.instance.currentUser!;

  late String name = user.displayName ?? '';
  late String email = user.email ?? '';
  late String photoUrl = user.photoURL ?? '';
}
