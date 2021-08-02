import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel friend;
  final bool isRemovable;
  final VoidCallback onPressed;

  const PersonTileWidget(
      {Key? key,
      required this.friend,
      this.isRemovable = false,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: NetworkImage(this.friend.photoURL ??
                  "https://lh3.googleusercontent.com/proxy/TFDc8tiU20EmoJpfPyhph5WEw_fUdSfUVoR4PyOIoVJvYCWC2fYREnjHQyZ4C_OXQpkbXjn16EaJSvVE-w"),
              fit: BoxFit.cover),
        ),
      ),
      title: Text(
        this.friend.name,
        style: isRemovable
            ? AppTheme.textStyles.personTileTitleSelected
            : AppTheme.textStyles.personTileTitle,
      ),
      trailing: IconButton(
        icon: isRemovable
            ? Icon(
                Icons.remove,
                color: AppTheme.colors.iconRemove,
              )
            : Icon(
                Icons.add,
                color: AppTheme.colors.iconAdd,
              ),
        onPressed: onPressed,
      ),
    );
  }
}
