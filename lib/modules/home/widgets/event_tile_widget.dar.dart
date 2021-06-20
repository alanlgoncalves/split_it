import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/icon_dolar_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  final int friends;

  const EventTileWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.value,
      required this.friends})
      : super(key: key);

  IconDollarType get type =>
      value >= 0 ? IconDollarType.RECEIVE : IconDollarType.SEND;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconDollarWidget(
          type: type,
        ),
        Expanded(
          child: ListTile(
            title: Text(
              title,
              style: AppTheme.textStyles.eventTileSubtitle,
            ),
            subtitle: Text(
              subtitle,
              style: AppTheme.textStyles.eventTileSubtitle,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "R\$ ${value.toStringAsFixed(2)}",
                  style: AppTheme.textStyles.eventTileMoney,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$friends ${friends > 1 ? "amigos(as)" : "amigo(a)"}",
                  style: AppTheme.textStyles.eventTileFriends,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
