import 'package:flutter/material.dart';
import 'package:split_it/modules/group/widgets/group_appbar.dart';
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
        child: Column(
          children: [
            Container(
              height: 8,
              color: AppTheme.colors.groupSpacesDivider,
            )
          ],
        ),
      ),
    );
  }
}
