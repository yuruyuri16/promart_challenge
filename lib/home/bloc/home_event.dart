part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeUsersRequested extends HomeEvent {}

class HomeUserDeletePressed extends HomeEvent {
  const HomeUserDeletePressed(this.user);

  final User user;
}
