import 'package:flutter/material.dart';
import 'package:split_it/modules/home/widgets/icon_dolar_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel event;

  const EventTileWidget({Key? key, required this.event}) : super(key: key);

  IconDollarType get type =>
      event.value >= 0 ? IconDollarType.RECEIVE : IconDollarType.SEND;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconDollarWidget(
          type: type,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    event.title,
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  subtitle: Text(
                    event.createdAt.toIso8601String(),
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "R\$ ${event.value.toStringAsFixed(2)}",
                        style: AppTheme.textStyles.eventTileMoney,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${event.friends} ${event.friends > 1 ? "amigos(as)" : "amigo(a)"}",
                        style: AppTheme.textStyles.eventTileFriends,
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: AppTheme.colors.divider,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
