import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/modules/home/widgets/icon_dolar_widget.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'loading_widget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel event;
  final bool isLoading;

  const EventTileWidget(
      {Key? key, required this.event, required this.isLoading})
      : super(key: key);

  IconDollarType get type =>
      event.value! >= 0 ? IconDollarType.RECEIVE : IconDollarType.SEND;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Row(
        children: [
          LoadingWidget(size: Size(48, 48)),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: LoadingWidget(size: Size(81, 19)),
                    subtitle: LoadingWidget(size: Size(52, 18)),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingWidget(size: Size(61, 17)),
                        SizedBox(
                          height: 5,
                        ),
                        LoadingWidget(size: Size(48, 18)),
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
                    event.title!,
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  subtitle: Text(
                    DateFormat('MMMMd').format(event.createdAt!),
                    style: AppTheme.textStyles.eventTileSubtitle,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        NumberFormat.simpleCurrency()
                            .format(event.value!.abs()),
                        style: AppTheme.textStyles.eventTileMoney,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${event.friends} ${event.friends! > 1 ? "amigos(as)" : "amigo(a)"}",
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
