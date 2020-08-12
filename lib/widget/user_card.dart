import 'package:facebook/widget/widgets.dart';
import 'package:flutter/material.dart';

import 'package:facebook/models/models.dart';

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({Key key, @required this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print(user.name),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              user.name,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
