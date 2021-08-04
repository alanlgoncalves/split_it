import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:split_it/modules/group/widgets/group_appbar.dart';
import 'package:split_it/modules/group/widgets/item_tile.dart';
import 'package:split_it/modules/group/widgets/persons_section.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    EventModel event = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Scaffold(
      appBar: GroupAppbarWidget(
        title: event.name,
        onTapBack: () {
          Navigator.pop(context);
        },
        onTapAction: () {},
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 8,
                color: AppTheme.colors.groupSpacesDivider,
              ),
              PersonSectionWidget(
                event: event,
              ),
              Container(
                height: 8,
                color: AppTheme.colors.groupSpacesDivider,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                  bottom: 19,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "ÍTENS",
                          style: AppTheme.textStyles.sectionTitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppTheme.colors.groupDivider,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                    children: event.items
                        .map(
                          (item) => Column(
                            children: [
                              ItemTileWidget(
                                name: item.name,
                                value: item.value,
                              ),
                              Container(
                                height: 1,
                                color: AppTheme.colors.groupDivider,
                              ),
                            ],
                          ),
                        )
                        .toList()),
              ),
              Container(
                color: AppTheme.colors.groupSpacesDivider,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title:
                          Text("Total", style: AppTheme.textStyles.itemValue),
                      trailing: Text.rich(
                        TextSpan(
                          text:
                              "${NumberFormat.simpleCurrency().format(event.itemsValue).toString().split(" ")[0]} ",
                          style: AppTheme.textStyles.currencySymbol,
                          children: [
                            TextSpan(
                                text: NumberFormat.simpleCurrency()
                                    .format(event.itemsValue)
                                    .toString()
                                    .split(" ")[1],
                                style: AppTheme.textStyles.itemValue)
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 24,
                  bottom: 19,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Faltam R\$126,00",
                          style: AppTheme.textStyles.remainingValue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
