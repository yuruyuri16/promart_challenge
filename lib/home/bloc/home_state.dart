// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  failure;

  bool get isLoading => this == HomeStatus.loading;
  bool get isSuccess => this == HomeStatus.success;
  bool get isFailure => this == HomeStatus.failure;
}

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.users = const [],
  });

  final HomeStatus status;
  final List<User> users;

  HomeState copyWith({
    HomeStatus? status,
    List<User>? users,
  }) {
    return HomeState(
      status: status ?? this.status,
      users: users ?? this.users,
    );
  }

  @override
  List<Object> get props => [status, users];
}
