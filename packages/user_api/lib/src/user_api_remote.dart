import 'package:user_api/src/models/models.dart';

/// {@template interface_user_api_remote}
/// The interface for an API that provides access to a list of users.
/// {@endtemplate}
abstract class IUserApiRemote {
  /// {@macro interface_user_api_remote}
  const IUserApiRemote();

  /// Fetches [List] of users
  Future<List<User>> getUsers();
}
