import 'package:dio/dio.dart';
import 'package:user_api/user_api.dart';
import 'package:user_api_remote/src/exceptions.dart';

/// {@template user_api_remote}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class UserApiRemote implements IUserApiRemote {
  /// {@macro user_api_remote}
  UserApiRemote({
    required Dio httpClient,
  }) : _httpClient = httpClient;

  final Dio _httpClient;

  @override
  Future<List<User>> getUsers() async {
    try {
      final response = await _httpClient.get<List<dynamic>>('/users');
      final users = response.data!
          .map((user) => User.fromJson(user as Map<String, dynamic>))
          .toList();
      return users;
    } on DioError catch (_) {
      throw UsersRequestFailureException();
    }
  }
}
