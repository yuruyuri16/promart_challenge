import 'package:user_api/user_api.dart';

/// {@template user_repository}
/// A repository that handles user related requests.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  const UserRepository({
    required IUserApiRemote userApiRemote,
    required IUserApiLocal userApiLocal,
  })  : _userApiRemote = userApiRemote,
        _userApiLocal = userApiLocal;

  final IUserApiRemote _userApiRemote;
  final IUserApiLocal _userApiLocal;

  /// Provides a [List] of all users.
  Stream<List<User>> users() => _userApiLocal.users();

  ///
  Future<void> init() async {
    await _userApiLocal.init();
  }

  ///
  Future<void> getUsers() async {
    final currentUsers = await _userApiLocal.getUsers();
    if (currentUsers.isNotEmpty) return;

    final users = await _userApiRemote.getUsers();
    await _userApiLocal.saveUsers(users);
  }

  ///
  Future<void> deleteUser(User user) async {
    await _userApiLocal.deleteUser(user);
  }
}
