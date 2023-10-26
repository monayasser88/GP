part of 'tickets_cubit.dart';

@immutable
sealed class TicketsState {}

final class TicketsInitial extends TicketsState {}
final class TicketsLoaded extends TicketsState {
  final List<Map<String, dynamic>> tickets;

  TicketsLoaded(this.tickets);
}
final class TicketsLoading extends TicketsState {}
final class TicketsError extends TicketsState {
  final String errMassage;

  TicketsError(this.errMassage);
}
