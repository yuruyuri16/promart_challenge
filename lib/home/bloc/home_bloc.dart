import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._userRepository) : super(const HomeState()) {
    on<HomeUsersRequested>(_usersRequested);
  }

  final UserRepository _userRepository;

  ///
  Future<void> _usersRequested(
    HomeUsersRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    await _userRepository.getUsers();
    await emit.forEach(
      _userRepository.users(),
      onData: (users) {
        return state.copyWith(
          status: HomeStatus.success,
          users: users,
        );
      },
      onError: (error, stackTrace) =>
          state.copyWith(status: HomeStatus.failure),
    );
  }
}
