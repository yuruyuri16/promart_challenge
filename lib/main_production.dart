import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:promart_challenge/app/app.dart';
import 'package:promart_challenge/bootstrap.dart';
import 'package:user_api_local/user_api_local.dart';
import 'package:user_api_remote/user_api_remote.dart';
import 'package:user_repository/user_repository.dart';

void main() {
  bootstrap(() async {
    await dotenv.load();
    final httpClient = Dio(
      BaseOptions(
        baseUrl: dotenv.get('JSONPLACEHOLDER_URL'),
      ),
    );
    final userApiRemote = UserApiRemote(httpClient: httpClient);
    final userApiLocal = UserApiLocal();
    final userRepository = UserRepository(
      userApiRemote: userApiRemote,
      userApiLocal: userApiLocal,
    );
    await userRepository.init();
    return App(userRepository: userRepository);
  });
}
