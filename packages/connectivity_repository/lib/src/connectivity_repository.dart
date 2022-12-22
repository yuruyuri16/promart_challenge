import 'package:connectivity_plus/connectivity_plus.dart';

/// {@template connectivity_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ConnectivityRepository {
  /// {@macro connectivity_repository}
  ConnectivityRepository({
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  ///
  Stream<ConnectivityResult> onConnectivityChanged() {
    return _connectivity.onConnectivityChanged;
  }
}
