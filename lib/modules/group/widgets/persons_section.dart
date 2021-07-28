import 'package:flutter/material.dart';
import 'package:split_it/modules/group/widgets/person_tile.dart';
import 'package:split_it/theme/app_theme.dart';

class PersonSectionWidget extends StatefulWidget {
  const PersonSectionWidget({Key? key}) : super(key: key);

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
          PersonTileWidget(
            name: "Você",
            value: 126,
          ),
          PersonTileWidget(
            name: "João",
            value: -127.5,
          ),
        ],
      ),
    );
  }
}
