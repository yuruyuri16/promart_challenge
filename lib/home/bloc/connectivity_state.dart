// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'connectivity_bloc.dart';

class ConnectivityState extends Equatable {
  const ConnectivityState({
    this.isOnline = false,
  });

  final bool isOnline;

  @override
  List<Object> get props => [isOnline];

  ConnectivityState copyWith({
    bool? isOnline,
  }) {
    return ConnectivityState(
      isOnline: isOnline ?? this.isOnline,
    );
  }
}
