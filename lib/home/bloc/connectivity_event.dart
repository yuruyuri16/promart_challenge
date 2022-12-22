part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

class ConnectivityStatusChanged extends ConnectivityEvent {
  const ConnectivityStatusChanged(this.status);

  final ConnectivityResult status;

  @override
  List<Object> get props => [status];
}
