part of 'check_if_user_exists_cubit.dart';

@immutable
sealed class CheckIfUserExistsState {}

final class CheckIfUserExistsInitial extends CheckIfUserExistsState {}

final class CheckIfUserExistsSuccess extends CheckIfUserExistsState {}

final class CheckIfUserExistsLoading extends CheckIfUserExistsState {}

final class CheckIfUserExistsFaluire extends CheckIfUserExistsState {}
