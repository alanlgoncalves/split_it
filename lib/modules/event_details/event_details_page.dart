import 'package:flutter/material.dart';
import 'package:split_it/modules/event_details/widgets/event_details_appbar.dart';
import 'package:split_it/modules/event_details/widgets/item_tile.dart';
import 'package:split_it/modules/event_details/widgets/persons_section.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/utils/money_formatter.dart';
import 'package:split_it/theme/app_theme.dart';

class EventDetailsPage extends StatefulWidget {
  const EventDetailsPage({Key? key}) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    EventModel event = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Scaffold(
      appBar: EventDetailsAppbarWidget(
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
              SizedBox(
                height: 20,
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
                          text: "${event.itemsValue.currencySymbol()} ",
                          style: AppTheme.textStyles.currencySymbol,
                          children: [
                            TextSpan(
                                text: event.itemsValue
                                    .simpleCurrencyWithoutSimbol(),
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
                          "Faltam ${event.remainingValue.simpleCurrency()}",
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
