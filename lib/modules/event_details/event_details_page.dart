import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import 'package:split_it/modules/event_details/event_details_controller.dart';
import 'package:split_it/modules/event_details/event_details_status.dart';
import 'package:split_it/modules/event_details/widgets/event_details_appbar.dart';
import 'package:split_it/modules/event_details/widgets/item_tile.dart';
import 'package:split_it/modules/event_details/widgets/persons_section.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/shared/repositories/firebase_repository.dart';
import 'package:split_it/shared/utils/money_formatter.dart';
import 'package:split_it/theme/app_theme.dart';

class EventDetailsPage extends StatefulWidget {
  final EventModel event;

  const EventDetailsPage({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  late ReactionDisposer _disposer;

  late EventDetailsController controller;

  @override
  void initState() {
    this.controller = EventDetailsController(
        firebaseRepository: FirebaseRepository(), event: widget.event);

    _disposer = autorun((_) {
      if (controller.status == EventDetailsStatus.success) {
        BotToast.closeAllLoading();

        BotToast.showText(text: "Deletado com sucesso!");

        Navigator.pop(context);
      } else if (controller.status == EventDetailsStatus.error) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Icon(Icons.warning),
            content: Text(
              "Não foi possível deletar o evento, tente novamente mais tarde.",
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (controller.status == EventDetailsStatus.loading) {
        BotToast.showLoading();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _disposer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EventDetailsAppbarWidget(
        title: widget.event.name,
        onTapBack: () {
          Navigator.pop(context);
        },
        onTapAction: () {
          controller.delete(widget.event.id);
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 8,
                color: AppTheme.colors.groupSpacesDivider,
              ),
              PersonSectionWidget(controller: controller),
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
                    children: widget.event.items
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
                          text: "${widget.event.itemsValue.currencySymbol()} ",
                          style: AppTheme.textStyles.currencySymbol,
                          children: [
                            TextSpan(
                                text: widget.event.itemsValue
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
                        Observer(builder: (_) {
                          if (controller.event.remainingValue > 0) {
                            return Text(
                              "Faltam ${controller.event.remainingValue.simpleCurrency()}",
                              style: AppTheme.textStyles.remainingValue,
                            );
                          } else {
                            return Container();
                          }
                        })
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
