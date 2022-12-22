import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_repository/connectivity_repository.dart';
import 'package:equatable/equatable.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc(this._connectivityRepository)
      : super(const ConnectivityState()) {
    on<ConnectivityStatusChanged>(_onStatusChanged);
    _subscription = _connectivityRepository
        .onConnectivityChanged()
        .listen((status) => add(ConnectivityStatusChanged(status)));
  }

  final ConnectivityRepository _connectivityRepository;
  late final StreamSubscription<ConnectivityResult> _subscription;

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  void _onStatusChanged(
    ConnectivityStatusChanged event,
    Emitter<ConnectivityState> emit,
  ) {
    emit(state.copyWith(isOnline: event.status.isOnline));
  }
}

extension on ConnectivityResult {
  bool get isOnline => [
        ConnectivityResult.mobile,
        ConnectivityResult.wifi,
      ].contains(this);
}
