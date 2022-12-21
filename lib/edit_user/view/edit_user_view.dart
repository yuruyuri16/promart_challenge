import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:promart_challenge/edit_user/edit_user.dart';
import 'package:promart_challenge/l10n/l10n.dart';

class EditUserView extends StatelessWidget {
  const EditUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isNewUser =
        context.select((EditUserBloc bloc) => bloc).state.isNewUser;
    return BlocListener<EditUserBloc, EditUserState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status.isSubmissionSuccess,
      listener: (_, __) => Navigator.pop<void>(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            isNewUser
                ? l10n.editUserAddAppBarTitle
                : l10n.editUserEditAppBarTitle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                _NameField(),
                SizedBox(height: 16),
                _UsernameField(),
                SizedBox(height: 16),
                _EmailField(),
                SizedBox(height: 16),
                _PhoneField(),
                SizedBox(height: 16),
                _StreetField(),
                SizedBox(height: 16),
                _SuiteField(),
                SizedBox(height: 16),
                _CityField(),
                SizedBox(height: 16),
                _ZipcodeField(),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () =>
              context.read<EditUserBloc>().add(EditUserSubmitted()),
          child: const Icon(Icons.check_rounded),
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.name.value,
      onChanged: (name) =>
          context.read<EditUserBloc>().add(EditUserNameChanged(name)),
      decoration: InputDecoration(
        labelText: l10n.editUserNameLabel,
      ),
    );
  }
}

class _UsernameField extends StatelessWidget {
  const _UsernameField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.username.value,
      onChanged: (username) =>
          context.read<EditUserBloc>().add(EditUserUsernameChanged(username)),
      decoration: InputDecoration(
        labelText: l10n.editUserUsernameLabel,
      ),
    );
  }
}

class _EmailField extends StatelessWidget {
  const _EmailField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.email.value,
      onChanged: (email) =>
          context.read<EditUserBloc>().add(EditUserEmailChanged(email)),
      decoration: InputDecoration(
        labelText: l10n.editUserEmailLabel,
      ),
    );
  }
}

class _PhoneField extends StatelessWidget {
  const _PhoneField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.phone.value,
      onChanged: (phone) =>
          context.read<EditUserBloc>().add(EditUserPhoneChanged(phone)),
      decoration: InputDecoration(
        labelText: l10n.editUserPhoneLabel,
      ),
    );
  }
}

class _StreetField extends StatelessWidget {
  const _StreetField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.street.value,
      onChanged: (street) =>
          context.read<EditUserBloc>().add(EditUserStreetChanged(street)),
      decoration: InputDecoration(
        labelText: l10n.editUserStreetLabel,
      ),
    );
  }
}

class _SuiteField extends StatelessWidget {
  const _SuiteField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.suite.value,
      onChanged: (suite) =>
          context.read<EditUserBloc>().add(EditUserSuiteChanged(suite)),
      decoration: InputDecoration(
        labelText: l10n.editUserSuiteLabel,
      ),
    );
  }
}

class _CityField extends StatelessWidget {
  const _CityField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.city.value,
      onChanged: (city) =>
          context.read<EditUserBloc>().add(EditUserCityChanged(city)),
      decoration: InputDecoration(
        labelText: l10n.editUserCityLabel,
      ),
    );
  }
}

class _ZipcodeField extends StatelessWidget {
  const _ZipcodeField();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<EditUserBloc>().state;
    return TextFormField(
      initialValue: state.zipcode.value,
      onChanged: (zipcode) =>
          context.read<EditUserBloc>().add(EditUserZipcodeChanged(zipcode)),
      decoration: InputDecoration(
        labelText: l10n.editUserZipcodeLabel,
      ),
    );
  }
}
