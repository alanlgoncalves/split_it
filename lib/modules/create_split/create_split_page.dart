import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:split_it/modules/create_split/create_split_controller.dart';
import 'package:split_it/modules/create_split/steps/three/step_three_page.dart';
import 'package:split_it/modules/create_split/steps/two/step_two_page.dart';
import 'package:split_it/modules/create_split/widgets/bottom_stepper_bar.dart';
import 'package:split_it/modules/create_split/widgets/create_split_appbar.dart';
import 'package:split_it/theme/app_theme.dart';

import 'steps/one/step_one_page.dart';

class CreateSplitPage extends StatefulWidget {
  const CreateSplitPage({Key? key}) : super(key: key);

  @override
  _CreateSplitPageState createState() => _CreateSplitPageState();
}

class _CreateSplitPageState extends State<CreateSplitPage> {
  final controller = CreateSplitController();
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      StepOnePage(
        controller: controller,
      ),
      StepTwoPage(),
      StepTheePage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.backgroundPrimary,
      appBar: CreateSplitAppbarWidget(
        controller: controller,
        size: pages.length,
      ),
      body: Observer(
        builder: (_) {
          return pages[controller.currentPage];
        },
      ),
      bottomNavigationBar: SafeArea(
          child: BottomStepperBarWidget(
        controller: controller,
        onTapCancel: () {},
        onTapNext: controller.nextPage,
      )),
    );
  }
}
