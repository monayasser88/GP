part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
final class ChangePasswordInProgress extends ChangePasswordState {}
final class ChangePasswordSuccess extends ChangePasswordState {}
final class ChangePasswordFailure extends ChangePasswordState {}

