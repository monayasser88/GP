part of 'tickets_cubit.dart';

@immutable
sealed class TicketsState {}

final class TicketsInitial extends TicketsState {}
final class TicketsLoaded extends TicketsState {
  final List<TicketModel> _tickets;

  TicketsLoaded(List<TicketModel> ticketList)
      : _tickets = ticketList;

  List<TicketModel> get tickets => _tickets;
}
final class TicketsLoading extends TicketsState {}
final class TicketsError extends TicketsState {
  final String errMassage;

  TicketsError(this.errMassage);
}
