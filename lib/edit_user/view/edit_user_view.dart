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

    final state = context.watch<EditUserBloc>().state;
    return BlocListener<EditUserBloc, EditUserState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status.isSubmissionSuccess,
      listener: (_, __) => Navigator.pop<void>(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            state.isNewUser
                ? l10n.editUserAddAppBarTitle
                : l10n.editUserEditAppBarTitle,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: EditUserForm(),
          ),
        ),
        floatingActionButton: state.status.isValidated
            ? FloatingActionButton(
                onPressed: () =>
                    context.read<EditUserBloc>().add(EditUserSubmitted()),
                tooltip: state.isNewUser
                    ? l10n.editUserAddFloatingActionButtonTooltip
                    : l10n.editUserEditFloatingActionButtonTooltip,
                child: const Icon(Icons.check_rounded),
              )
            : null,
      ),
    );
  }
}
