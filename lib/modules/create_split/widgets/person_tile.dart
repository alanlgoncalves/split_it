import 'package:flutter/material.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/theme/app_theme.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

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
              image: this.friend.photoURL != null
                  ? NetworkImage(this.friend.photoURL!)
                  : Svg("assets/images/default-user-avatar.svg",
                      size: Size(28, 28)) as ImageProvider,
              fit: this.friend.photoURL != null ? BoxFit.cover : BoxFit.none),
          color: AppTheme.colors.checkboxActive,
          border: this.friend.photoURL == null
              ? Border.fromBorderSide(
                  BorderSide(color: AppTheme.colors.checkboxBorderActive),
                )
              : null,
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
