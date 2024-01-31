part of 'sign_up_with_email_passwod_cubit.dart';

@immutable
sealed class SignUpWithEmailPasswodState {}

final class SignUpWithEmailPasswodInitial extends SignUpWithEmailPasswodState {}

final class SignUpWithEmailPasswodLoading extends SignUpWithEmailPasswodState {}

final class SignUpWithEmailPasswodSuccess extends SignUpWithEmailPasswodState {}

final class SignUpWithEmailPasswodFaluire extends SignUpWithEmailPasswodState {
  final String errMessage;

  SignUpWithEmailPasswodFaluire(this.errMessage);
}
