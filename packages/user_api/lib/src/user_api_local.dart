import 'package:user_api/src/models/models.dart';

/// {@template interface_user_api_local}
/// User Api Local interface
/// {@endtemplate}
abstract class IUserApiLocal {
  /// {@macro interface_user_api_local}
  const IUserApiLocal();

  ///
  Future<void> init();

  ///
  Future<List<User>> getUsers();

  /// Provides a [Stream] of all users
  Stream<List<User>> users();

  /// Saves a [List] of users
  Future<void> saveUsers(List<User> users);

  ///
  Future<void> updateUser(User user);

  ///
  Future<void> deleteUser(User user);
}
