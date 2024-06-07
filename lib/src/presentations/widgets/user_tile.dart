import 'package:code_generation_flutter/src/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({
    required this.user,
    super.key,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          user.avatar,
        ),
      ),
      title: Text('${user.firstName} ${user.lastName}'),
      subtitle: Text(user.email),
    );
  }
}
