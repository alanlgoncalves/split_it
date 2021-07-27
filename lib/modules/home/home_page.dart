import 'package:flutter/material.dart';
import 'package:split_it/modules/home/home_controller.dart';
import 'package:split_it/modules/home/widgets/app_bar/app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/bottom_app_bar/bottom_app_bar_widget.dart';
import 'package:split_it/modules/home/widgets/event_tile_widget.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/shared/models/event_model.dart';
import 'package:split_it/theme/app_theme.dart';

import 'home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    controller.getEvents();
    controller.listen((state) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        ModalRoute.of(context)!.settings.arguments as UserModel;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 80,
            collapsedHeight: 80,
            elevation: 0,
            flexibleSpace: AppBarWidget(
              user: user,
              onTapAddButton: () {
                Navigator.pushNamed(context, "/create_split");
              },
            ),
          ),
          SliverAppBar(
            expandedHeight: 170,
            collapsedHeight: 80,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    height: 26,
                    color: AppTheme.colors.backgroundSecondary,
                  ),
                  Stack(
                    children: [
                      Container(
                        color: AppTheme.colors.backgroundSecondary,
                        height: 80,
                      ),
                      BottomAppBarWidget(),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (controller.state is HomeStateLoading) ...[
                        ...List.generate(
                            4,
                            (index) => EventTileWidget(
                                event: EventModel(), isLoading: true))
                      ] else if (controller.state is HomeStateSuccess) ...[
                        ...(controller.state as HomeStateSuccess)
                            .events
                            .map((event) => EventTileWidget(
                                  event: event,
                                  isLoading: false,
                                ))
                      ] else if (controller.state is HomeStateFailure) ...[
                        Text((controller.state as HomeStateFailure).message)
                      ] else ...[
                        Container()
                      ]
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
