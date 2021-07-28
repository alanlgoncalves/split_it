import 'package:flutter/material.dart';
import 'package:split_it/modules/group/widgets/group_appbar.dart';
import 'package:split_it/modules/group/widgets/person_tile.dart';
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
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Integrantes"),
                      ],
                    ),
                    PersonTileWidget(
                      name: "Você",
                    ),
                    PersonTileWidget(
                      name: "João",
                    ),
                    PersonTileWidget(
                      name: "José",
                    ),
                  ],
                ),
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
                        Text("Ítens"),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: AppTheme.colors.groupSpacesDivider,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Picanha"),
                      trailing: Text("R\$122,00"),
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupSpacesDivider,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Linguiça"),
                      trailing: Text("R\$122,00"),
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupSpacesDivider,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Carvão"),
                      trailing: Text("R\$122,00"),
                    ),
                    Container(
                      height: 1,
                      color: AppTheme.colors.groupSpacesDivider,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Cerveja"),
                      trailing: Text("R\$122,00"),
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
                      title: Text("Total"),
                      trailing: Text("R\$122,00"),
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
                        Text("Faltam R\$126,00"),
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
