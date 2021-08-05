import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:split_it/shared/models/friend_model.dart';
import 'package:split_it/shared/utils/money_formatter.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonTileWidget extends StatelessWidget {
  final FriendModel friend;
  final double value;
  final bool isChecked;
  final Function(bool? value) onChanged;

  PersonTileWidget(
      {Key? key,
      required this.friend,
      required this.value,
      required this.onChanged,
      this.isChecked = false})
      : super(key: key);

  Color get checkboxColor => isChecked
      ? AppTheme.colors.checkboxActive
      : AppTheme.colors.checkboxInactive;

  Color get checkboxBorderColor => isChecked
      ? AppTheme.colors.checkboxBorderActive
      : AppTheme.colors.checkboxBorderInactive;

  TextStyle get valueTextStyle => isChecked
      ? AppTheme.textStyles.personValuePositive
      : AppTheme.textStyles.personValueNegative;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 0),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: friend.photoURL != null
                  ? NetworkImage(friend.photoURL!)
                  : Svg("assets/images/default-user-avatar.svg",
                      size: Size(28, 28)) as ImageProvider,
              fit: friend.photoURL != null ? BoxFit.cover : BoxFit.none),
          color: AppTheme.colors.checkboxActive,
          border: friend.photoURL == null
              ? Border.fromBorderSide(
                  BorderSide(color: AppTheme.colors.checkboxBorderActive),
                )
              : null,
        ),
      ),
      title: Text(
        this.friend.name,
        style: AppTheme.textStyles.personName,
      ),
      subtitle: Text(
        value.abs().simpleCurrency(),
        style: valueTextStyle,
      ),
      trailing: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: checkboxColor,
          border: Border.fromBorderSide(
            BorderSide(
              width: 1,
              color: checkboxBorderColor,
            ),
          ),
        ),
        child: Checkbox(
          activeColor: Color(0xFF40B38C),
          onChanged: onChanged,
          value: isChecked,
        ),
      ),
    );
  }
}
