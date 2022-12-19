import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:promart_challenge/l10n/l10n.dart';
import 'package:user_api/user_api.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    super.key,
    required this.user,
    this.onEdit,
    this.onDelete,
  });

  final ValueChanged<BuildContext>? onEdit;
  final ValueChanged<BuildContext>? onDelete;
  final User user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: onEdit,
            icon: Icons.edit,
            label: l10n.homeEditUserText,
          ),
          SlidableAction(
            onPressed: onDelete,
            icon: Icons.delete,
            label: l10n.homeDeleteUserText,
          )
        ],
      ),
      child: ListTile(
        title: Text(user.name),
        subtitle: Text(user.username),
      ),
    );
  }
}
