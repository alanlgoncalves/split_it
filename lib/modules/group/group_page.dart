import 'package:flutter/material.dart';
import 'package:split_it/modules/group/widgets/group_appbar.dart';
import 'package:split_it/modules/group/widgets/item_tile.dart';
import 'package:split_it/modules/group/widgets/persons_section.dart';
import 'package:split_it/theme/app_theme.dart';

class GroupPage extends StatefulWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GroupAppbarWidget(
        title: "Churrasco",
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
              PersonSectionWidget(),
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
                  children: [
                    ItemTileWidget(
                      name: "Picanha",
                      value: 122,
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupDivider,
                    ),
                    ItemTileWidget(
                      name: "Linguicinha",
                      value: 17,
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupDivider,
                    ),
                    ItemTileWidget(
                      name: "Carvão",
                      value: 19,
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupDivider,
                    ),
                    ItemTileWidget(
                      name: "Cerveja",
                      value: 68,
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupDivider,
                    ),
                    ItemTileWidget(
                      name: "Refrigerante",
                      value: 12,
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupDivider,
                    ),
                    ItemTileWidget(
                      name: "Pão de alho",
                      value: 15,
                    ),
                  ],
                ),
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
                          text: "R\$",
                          style: AppTheme.textStyles.currencySymbol,
                          children: [
                            TextSpan(
                                text: "122,00",
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
