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
  List<User> users();

  /// Provides a [Stream] of all users
  Stream<List<User>> getUsers();

  /// Saves a [List] of users
  Future<void> saveUsers(List<User> users);
}
