import 'package:flutter/material.dart';
import 'package:split_it/modules/event_details/event_details_controller.dart';
import 'package:split_it/modules/event_details/widgets/person_tile.dart';

import 'package:split_it/theme/app_theme.dart';

class PersonSectionWidget extends StatefulWidget {
  final EventDetailsController controller;

  const PersonSectionWidget({Key? key, required this.controller})
      : super(key: key);

  @override
  _PersonSectionWidgetState createState() => _PersonSectionWidgetState();
}

class _PersonSectionWidgetState extends State<PersonSectionWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "INTEGRANTES",
                style: AppTheme.textStyles.sectionTitle,
              ),
            ],
          ),
          ...widget.controller.event.friends
              .map(
                (friend) => PersonTileWidget(
                  friend: friend,
                  event: widget.controller.event,
                  value: widget.controller.event.splitValue,
                  onChanged: (friend) {
                    widget.controller.updateFriend(friend);

                    setState(() {});
                  },
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
