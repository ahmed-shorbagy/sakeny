part of 'sign_in_email_password_cubit.dart';

@immutable
sealed class SignInEmailPasswordState {}

final class SignInEmailPasswordInitial extends SignInEmailPasswordState {}

final class SignInEmailPasswordLoading extends SignInEmailPasswordState {}

final class SignInEmailPasswordSuccess extends SignInEmailPasswordState {}

final class SignInEmailPasswordFaluire extends SignInEmailPasswordState {
  final String errMessage;

  SignInEmailPasswordFaluire(this.errMessage);
}
