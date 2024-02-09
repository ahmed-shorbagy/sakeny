part of 'new_user_cubit.dart';

@immutable
sealed class NewUserState {}

final class NewUserInitial extends NewUserState {}

final class NewUserSuccess extends NewUserState {}

final class NewUserLoading extends NewUserState {}

final class NewUserFaluire extends NewUserState {
  final String errMessage;

  NewUserFaluire(this.errMessage);
}
