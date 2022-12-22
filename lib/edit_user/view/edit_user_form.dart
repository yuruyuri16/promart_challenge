import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promart_challenge/edit_user/edit_user.dart';
import 'package:promart_challenge/l10n/l10n.dart';

class EditUserForm extends StatelessWidget {
  const EditUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      textCapitalization: TextCapitalization.words,
      initialValue: state.name.value,
      onChanged: (name) =>
          context.read<EditUserBloc>().add(EditUserNameChanged(name)),
      decoration: InputDecoration(
        labelText: l10n.editUserNameLabel,
        errorText: state.name.invalid ? l10n.editUserInvalidNameText : null,
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
        errorText:
            state.username.invalid ? l10n.editUserInvalidUsernameText : null,
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
        errorText: state.email.invalid ? l10n.editUserInvalidEmailText : null,
      ),
      keyboardType: TextInputType.emailAddress,
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
        errorText: state.phone.invalid ? l10n.editUserInvalidPhoneText : null,
      ),
      keyboardType: TextInputType.phone,
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
        errorText: state.street.invalid ? l10n.editUserInvalidStreetText : null,
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
        errorText: state.suite.invalid ? l10n.editUserInvalidSuiteText : null,
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
        errorText: state.city.invalid ? l10n.editUserInvalidCityText : null,
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
        errorText:
            state.zipcode.invalid ? l10n.editUserInvalidZipcodeText : null,
      ),
    );
  }
}
