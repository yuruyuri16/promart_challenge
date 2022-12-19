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
    final currentUsers = users();
    if (currentUsers.isNotEmpty) {
      _userStreamController.add(currentUsers);
    } else {
      _userStreamController.add(const <User>[]);
    }
  }

  @override
  Stream<List<User>> getUsers() => _userStreamController.asBroadcastStream();

  @override
  List<User> users() => isar.users.where().findAllSync();

  @override
  Future<void> saveUsers(List<User> users) async {
    _userStreamController.add(users);
    await isar.writeTxn(() async {
      await isar.users.putAll(users);
    });
  }
}
