import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_in_email_password_state.dart';

class SignInEmailPasswordCubit extends Cubit<SignInEmailPasswordState> {
  SignInEmailPasswordCubit() : super(SignInEmailPasswordInitial());
}
