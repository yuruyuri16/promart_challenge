import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocation_repository/geolocation_repository.dart';
import 'package:promart_challenge/edit_user/edit_user.dart';
import 'package:user_api/user_api.dart';
import 'package:user_repository/user_repository.dart';

class EditUserPage extends StatelessWidget {
  const EditUserPage({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditUserBloc(
        userRepository: context.read<UserRepository>(),
        geolocationRepository: context.read<GeolocationRepository>(),
        user: user,
      ),
      child: const EditUserView(),
    );
  }
}
