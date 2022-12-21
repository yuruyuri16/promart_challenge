import 'package:rxdart/subjects.dart';
import 'package:user_api/user_api.dart';

/// {@template user_api_local}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class UserApiLocal implements IUserApiLocal {
  /// {@macro user_api_local}
  UserApiLocal();

  /// Isar instance.
  late final Isar isar;

  final _userStreamController = BehaviorSubject<List<User>>.seeded(const []);

  @override
  Future<void> init() async {
    isar = await Isar.open([UserSchema]);
    final currentUsers = await getUsers();
    if (currentUsers.isNotEmpty) {
      _userStreamController.add(currentUsers);
    } else {
      _userStreamController.add(const <User>[]);
    }
  }

  @override
  Stream<List<User>> users() => _userStreamController.asBroadcastStream();

  @override
  Future<List<User>> getUsers() async => isar.users.where().findAll();

  @override
  Future<void> saveUser(User user) async {
    await isar.writeTxn(() async {
      final users = [..._userStreamController.value];
      final userIndex = users.indexWhere((t) => t.id == user.id);
      if (userIndex >= 0) {
        users[userIndex] = user;
      } else {
        users.add(user);
      }
      _userStreamController.add(users);
      await isar.users.put(user);
    });
  }

  @override
  Future<void> saveUsers(List<User> users) async {
    _userStreamController.add(users);
    await isar.writeTxn(() async {
      await isar.users.putAll(users);
    });
  }

  @override
  Future<void> deleteUser(User user) async {
    final users = [..._userStreamController.value];
    final userIndex = users.indexWhere((t) => t.id == user.id);
    users.removeAt(userIndex);
    _userStreamController.add(users);
    await isar.writeTxn(() async {
      await isar.users.delete(user.id!);
    });
  }
}
