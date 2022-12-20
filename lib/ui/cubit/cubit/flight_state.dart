part of 'flight_cubit.dart';

abstract class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object?> get props => [];
}

class FlightInitial extends FlightState {}

class FlightInitialState extends FlightState {
  final Status status;
  final List<Flight>? data;

  const FlightInitialState({
    required this.status,
    this.data,
  });
  @override
  List<Object?> get props => [status, data];
}

class UserFlightState extends FlightState {}
