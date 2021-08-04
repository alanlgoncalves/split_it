import 'package:flutter/material.dart';
import 'package:split_it/modules/group/widgets/person_tile.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonSectionWidget extends StatefulWidget {
  final EventModel event;

  const PersonSectionWidget({Key? key, required this.event}) : super(key: key);

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
          ...widget.event.friends
              .map((e) => PersonTileWidget(
                    name: e.name,
                    value: 126,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
