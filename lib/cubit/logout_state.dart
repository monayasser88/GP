part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}
final class LogoutInProgress extends LogoutState {}
final class LoggedOut extends LogoutState {}
final class LogoutFailure extends LogoutState {}