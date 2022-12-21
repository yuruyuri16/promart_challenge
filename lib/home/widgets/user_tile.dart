import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:promart_challenge/l10n/l10n.dart';
import 'package:user_api/user_api.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  final User user;
  final GestureTapCallback? onTap;
  final ValueChanged<BuildContext>? onEdit;
  final ValueChanged<BuildContext>? onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            backgroundColor: theme.colorScheme.tertiary,
            onPressed: onEdit,
            icon: Icons.edit,
            label: l10n.homeEditUserText,
          ),
          SlidableAction(
            backgroundColor: theme.colorScheme.error,
            onPressed: onDelete,
            icon: Icons.delete,
            label: l10n.homeDeleteUserText,
          )
        ],
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(user.username),
        subtitle: Text(user.email),
      ),
    );
  }
}
