import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._userRepository) : super(const HomeState()) {
    on<HomeUsersRequested>(_usersRequested);
    on<HomeUserDeletePressed>(_userDeletePressed);
  }

  final UserRepository _userRepository;

  Future<void> _usersRequested(
    HomeUsersRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      await _userRepository.getUsers();
      await emit.forEach(
        _userRepository.users(),
        onData: (users) => state.copyWith(
          status: HomeStatus.success,
          users: users,
        ),
        onError: (_, __) => state.copyWith(status: HomeStatus.failure),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }

  Future<void> _userDeletePressed(
    HomeUserDeletePressed event,
    Emitter<HomeState> emit,
  ) async {
    try {
      await _userRepository.deleteUser(event.user);
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.failure));
    }
  }
}
